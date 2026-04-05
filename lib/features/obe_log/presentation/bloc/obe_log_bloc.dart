import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/app_database.dart';
import '../../data/repositories/obe_repository.dart';

// ---------------------------------------------------------------------------
// Events
// ---------------------------------------------------------------------------

abstract class ObeLogEvent {}

class LoadObeLogs extends ObeLogEvent {}

class ObeLogSaved extends ObeLogEvent {}

// ---------------------------------------------------------------------------
// States
// ---------------------------------------------------------------------------

abstract class ObeLogState {}

class ObeLogInitial extends ObeLogState {}

class ObeLogLoading extends ObeLogState {}

class ObeLogLoaded extends ObeLogState {
  ObeLogLoaded(this.logs);
  final List<ObeLog> logs;
}

class ObeLogError extends ObeLogState {
  ObeLogError(this.message);
  final String message;
}

// ---------------------------------------------------------------------------
// BLoC
// ---------------------------------------------------------------------------

class ObeLogBloc extends Bloc<ObeLogEvent, ObeLogState> {
  ObeLogBloc({required ObeRepository repository})
      : _repository = repository,
        super(ObeLogInitial()) {
    on<LoadObeLogs>(_onLoadObeLogs);
    on<ObeLogSaved>(_onObeLogSaved);
  }

  final ObeRepository _repository;

  Future<void> _onLoadObeLogs(
    LoadObeLogs event,
    Emitter<ObeLogState> emit,
  ) async {
    emit(ObeLogLoading());
    try {
      final logs = await _repository.getObeLogs();
      emit(ObeLogLoaded(logs));
    } catch (e) {
      emit(ObeLogError(e.toString()));
    }
  }

  Future<void> _onObeLogSaved(
    ObeLogSaved event,
    Emitter<ObeLogState> emit,
  ) async {
    emit(ObeLogLoading());
    try {
      final logs = await _repository.getObeLogs();
      emit(ObeLogLoaded(logs));
    } catch (e) {
      emit(ObeLogError(e.toString()));
    }
  }
}
