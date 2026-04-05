import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/app_database.dart';
import '../../data/repositories/dream_repository.dart';
import 'dream_journal_bloc.dart';

// ---------------------------------------------------------------------------
// States
// ---------------------------------------------------------------------------

abstract class DreamEntryState {}

class DreamEntryInitial extends DreamEntryState {}

class DreamEntrySaving extends DreamEntryState {}

class DreamEntrySaved extends DreamEntryState {
  DreamEntrySaved(this.dreamId);
  final int dreamId;
}

class DreamEntryError extends DreamEntryState {
  DreamEntryError(this.message);
  final String message;
}

// ---------------------------------------------------------------------------
// Cubit
// ---------------------------------------------------------------------------

class DreamEntryCubit extends Cubit<DreamEntryState> {
  DreamEntryCubit({
    required DreamRepository repository,
    required DreamJournalBloc dreamJournalBloc,
  })  : _repository = repository,
        _dreamJournalBloc = dreamJournalBloc,
        super(DreamEntryInitial());

  final DreamRepository _repository;
  final DreamJournalBloc _dreamJournalBloc;

  Future<void> saveDream({
    required String title,
    required String description,
    String? rundownDate,
    required int dreamType,
    required int clarity,
    bool achievedLucidity = false,
    List<int> tagIds = const [],
    List<int> characterIds = const [],
  }) async {
    emit(DreamEntrySaving());
    try {
      final companion = DreamsCompanion.insert(
        title: title,
        description: description,
        rundownDate: Value(rundownDate),
        dreamType: Value(dreamType),
        clarity: Value(clarity),
        achievedLucidity: Value(achievedLucidity),
      );
      final id = await _repository.insertDream(companion);
      if (tagIds.isNotEmpty) {
        await _repository.setTagsForDream(id, tagIds);
      }
      for (final charId in characterIds) {
        await _repository.addCharacterToDream(id, charId);
      }
      _dreamJournalBloc.add(DreamSaved());
      emit(DreamEntrySaved(id));
    } catch (e) {
      emit(DreamEntryError(e.toString()));
    }
  }

  Future<void> updateDream({
    required int dreamId,
    required String title,
    required String description,
    String? rundownDate,
    required int dreamType,
    required int clarity,
    bool achievedLucidity = false,
    List<int> tagIds = const [],
    List<int> characterIds = const [],
  }) async {
    emit(DreamEntrySaving());
    try {
      final companion = DreamsCompanion(
        id: Value(dreamId),
        title: Value(title),
        description: Value(description),
        rundownDate: Value(rundownDate),
        dreamType: Value(dreamType),
        clarity: Value(clarity),
        achievedLucidity: Value(achievedLucidity),
      );
      await _repository.updateDream(companion);
      await _repository.setTagsForDream(dreamId, tagIds);
      await _repository.setCharactersForDream(dreamId, characterIds);
      _dreamJournalBloc.add(DreamSaved());
      emit(DreamEntrySaved(dreamId));
    } catch (e) {
      emit(DreamEntryError(e.toString()));
    }
  }
}
