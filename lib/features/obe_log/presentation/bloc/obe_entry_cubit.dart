import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/app_database.dart';
import '../../data/repositories/obe_repository.dart';
import 'obe_log_bloc.dart';

// ---------------------------------------------------------------------------
// States
// ---------------------------------------------------------------------------

abstract class ObeEntryState {}

class ObeEntryInitial extends ObeEntryState {}

class ObeEntrySaving extends ObeEntryState {}

class ObeEntrySaved extends ObeEntryState {
  ObeEntrySaved(this.obeLogId);
  final int obeLogId;
}

class ObeEntryError extends ObeEntryState {
  ObeEntryError(this.message);
  final String message;
}

// ---------------------------------------------------------------------------
// Cubit
// ---------------------------------------------------------------------------

class ObeEntryCubit extends Cubit<ObeEntryState> {
  ObeEntryCubit({
    required ObeRepository repository,
    required ObeLogBloc obeLogBloc,
  })  : _repository = repository,
        _obeLogBloc = obeLogBloc,
        super(ObeEntryInitial());

  final ObeRepository _repository;
  final ObeLogBloc _obeLogBloc;

  Future<void> saveObeLog({
    required String description,
    required DateTime sessionDate,
    required int entryState,
    String? techniqueNameOverride,
    String? intention,
    String? rundownDate,
    int? focusLevel,
    bool onsetReached = false,
    int? onsetIntensity,
    int? fieldType,
  }) async {
    emit(ObeEntrySaving());
    try {
      final companion = ObeLogsCompanion.insert(
        description: description,
        sessionDate: sessionDate,
        entryState: Value(entryState),
        techniqueNameOverride: Value(techniqueNameOverride),
        intention: Value(intention),
        rundownDate: Value(rundownDate),
        focusLevel: Value(focusLevel),
        onsetReached: Value(onsetReached),
        onsetIntensity: Value(onsetIntensity),
        fieldType: Value(fieldType),
      );
      final id = await _repository.insertObeLog(companion);
      _obeLogBloc.add(ObeLogSaved());
      emit(ObeEntrySaved(id));
    } catch (e) {
      emit(ObeEntryError(e.toString()));
    }
  }

  Future<void> updateObeLog({
    required int obeLogId,
    required String description,
    required DateTime sessionDate,
    required int entryState,
    String? techniqueNameOverride,
    String? intention,
    String? rundownDate,
    int? focusLevel,
    bool onsetReached = false,
    int? onsetIntensity,
    int? fieldType,
  }) async {
    emit(ObeEntrySaving());
    try {
      final companion = ObeLogsCompanion(
        id: Value(obeLogId),
        description: Value(description),
        sessionDate: Value(sessionDate),
        entryState: Value(entryState),
        techniqueNameOverride: Value(techniqueNameOverride),
        intention: Value(intention),
        rundownDate: Value(rundownDate),
        focusLevel: Value(focusLevel),
        onsetReached: Value(onsetReached),
        onsetIntensity: Value(onsetIntensity),
        fieldType: Value(fieldType),
      );
      await _repository.updateObeLog(companion);
      _obeLogBloc.add(ObeLogSaved());
      emit(ObeEntrySaved(obeLogId));
    } catch (e) {
      emit(ObeEntryError(e.toString()));
    }
  }
}
