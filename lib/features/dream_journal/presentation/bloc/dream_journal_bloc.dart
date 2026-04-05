import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/app_database.dart';
import '../../data/repositories/dream_repository.dart';

// ---------------------------------------------------------------------------
// Events
// ---------------------------------------------------------------------------

abstract class DreamJournalEvent {}

class LoadDreams extends DreamJournalEvent {}

class DreamSaved extends DreamJournalEvent {}

class FilterByTag extends DreamJournalEvent {
  FilterByTag(this.tagId, this.tagName);
  final int tagId;
  final String tagName;
}

class FilterByCharacter extends DreamJournalEvent {
  FilterByCharacter(this.characterId, this.characterName);
  final int characterId;
  final String characterName;
}

class ClearDreamFilter extends DreamJournalEvent {}

// ---------------------------------------------------------------------------
// States
// ---------------------------------------------------------------------------

abstract class DreamJournalState {}

class DreamJournalInitial extends DreamJournalState {}

class DreamJournalLoading extends DreamJournalState {}

class DreamJournalLoaded extends DreamJournalState {
  DreamJournalLoaded(
    this.dreams, {
    this.activeTagId,
    this.activeTagName,
    this.activeCharacterId,
    this.activeCharacterName,
  });
  final List<Dream> dreams;
  final int? activeTagId;
  final String? activeTagName;
  final int? activeCharacterId;
  final String? activeCharacterName;

  bool get isFiltered => activeTagId != null || activeCharacterId != null;
}

class DreamJournalError extends DreamJournalState {
  DreamJournalError(this.message);
  final String message;
}

// ---------------------------------------------------------------------------
// BLoC
// ---------------------------------------------------------------------------

class DreamJournalBloc extends Bloc<DreamJournalEvent, DreamJournalState> {
  DreamJournalBloc({required DreamRepository repository})
      : _repository = repository,
        super(DreamJournalInitial()) {
    on<LoadDreams>(_onLoadDreams);
    on<DreamSaved>(_onDreamSaved);
    on<FilterByTag>(_onFilterByTag);
    on<FilterByCharacter>(_onFilterByCharacter);
    on<ClearDreamFilter>(_onClearFilter);
  }

  final DreamRepository _repository;

  Future<void> _onLoadDreams(
    LoadDreams event,
    Emitter<DreamJournalState> emit,
  ) async {
    emit(DreamJournalLoading());
    try {
      final dreams = await _repository.getDreams();
      emit(DreamJournalLoaded(dreams));
    } catch (e) {
      emit(DreamJournalError(e.toString()));
    }
  }

  Future<void> _onDreamSaved(
    DreamSaved event,
    Emitter<DreamJournalState> emit,
  ) async {
    // Re-load with current filter if one is active.
    final current = state;
    if (current is DreamJournalLoaded && current.isFiltered) {
      if (current.activeTagId != null) {
        add(FilterByTag(current.activeTagId!, current.activeTagName!));
      } else if (current.activeCharacterId != null) {
        add(FilterByCharacter(
            current.activeCharacterId!, current.activeCharacterName!));
      }
      return;
    }
    emit(DreamJournalLoading());
    try {
      final dreams = await _repository.getDreams();
      emit(DreamJournalLoaded(dreams));
    } catch (e) {
      emit(DreamJournalError(e.toString()));
    }
  }

  Future<void> _onFilterByTag(
    FilterByTag event,
    Emitter<DreamJournalState> emit,
  ) async {
    emit(DreamJournalLoading());
    try {
      final dreams = await _repository.getDreamsByTag(event.tagId);
      emit(DreamJournalLoaded(
        dreams,
        activeTagId: event.tagId,
        activeTagName: event.tagName,
      ));
    } catch (e) {
      emit(DreamJournalError(e.toString()));
    }
  }

  Future<void> _onFilterByCharacter(
    FilterByCharacter event,
    Emitter<DreamJournalState> emit,
  ) async {
    emit(DreamJournalLoading());
    try {
      final dreams = await _repository.getDreamsByCharacter(event.characterId);
      emit(DreamJournalLoaded(
        dreams,
        activeCharacterId: event.characterId,
        activeCharacterName: event.characterName,
      ));
    } catch (e) {
      emit(DreamJournalError(e.toString()));
    }
  }

  Future<void> _onClearFilter(
    ClearDreamFilter event,
    Emitter<DreamJournalState> emit,
  ) async {
    emit(DreamJournalLoading());
    try {
      final dreams = await _repository.getDreams();
      emit(DreamJournalLoaded(dreams));
    } catch (e) {
      emit(DreamJournalError(e.toString()));
    }
  }
}
