import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/app_database.dart';
import '../../data/repositories/dream_repository.dart';

// ---------------------------------------------------------------------------
// Events
// ---------------------------------------------------------------------------

abstract class DreamJournalEvent {}

class LoadDreams extends DreamJournalEvent {}

class DreamSaved extends DreamJournalEvent {}

/// Replace the active tag filter with [tagIds] / [tagNames] (parallel lists).
/// Empty lists clear the tag filter. Character filter is cleared.
class FilterByTags extends DreamJournalEvent {
  FilterByTags(this.tagIds, this.tagNames)
      : assert(tagIds.length == tagNames.length);
  final List<int> tagIds;
  final List<String> tagNames;
}

/// Replace the active character filter with [characterIds] / [characterNames].
/// Empty lists clear the character filter. Tag filter is cleared.
class FilterByCharacters extends DreamJournalEvent {
  FilterByCharacters(this.characterIds, this.characterNames)
      : assert(characterIds.length == characterNames.length);
  final List<int> characterIds;
  final List<String> characterNames;
}

class ClearDreamFilter extends DreamJournalEvent {}

class SearchDreams extends DreamJournalEvent {
  SearchDreams(this.query);
  final String query;
}

// ---------------------------------------------------------------------------
// States
// ---------------------------------------------------------------------------

abstract class DreamJournalState {}

class DreamJournalInitial extends DreamJournalState {}

class DreamJournalLoading extends DreamJournalState {}

class DreamJournalLoaded extends DreamJournalState {
  DreamJournalLoaded(
    this.dreams, {
    this.activeTagIds = const [],
    this.activeTagNames = const [],
    this.activeCharacterIds = const [],
    this.activeCharacterNames = const [],
    this.activeSearchQuery,
  });
  final List<Dream> dreams;
  final List<int> activeTagIds;
  final List<String> activeTagNames;
  final List<int> activeCharacterIds;
  final List<String> activeCharacterNames;
  final String? activeSearchQuery;

  bool get isFiltered =>
      activeTagIds.isNotEmpty || activeCharacterIds.isNotEmpty;
  bool get isSearching =>
      activeSearchQuery != null && activeSearchQuery!.isNotEmpty;
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
    on<FilterByTags>(_onFilterByTags);
    on<FilterByCharacters>(_onFilterByCharacters);
    on<ClearDreamFilter>(_onClearFilter);
    on<SearchDreams>(_onSearchDreams);
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
    // Re-load with current filter/search if one is active.
    final current = state;
    if (current is DreamJournalLoaded) {
      if (current.activeTagIds.isNotEmpty) {
        add(FilterByTags(current.activeTagIds, current.activeTagNames));
        return;
      }
      if (current.activeCharacterIds.isNotEmpty) {
        add(FilterByCharacters(
            current.activeCharacterIds, current.activeCharacterNames));
        return;
      }
      if (current.isSearching) {
        add(SearchDreams(current.activeSearchQuery!));
        return;
      }
    }
    emit(DreamJournalLoading());
    try {
      final dreams = await _repository.getDreams();
      emit(DreamJournalLoaded(dreams));
    } catch (e) {
      emit(DreamJournalError(e.toString()));
    }
  }

  Future<void> _onFilterByTags(
    FilterByTags event,
    Emitter<DreamJournalState> emit,
  ) async {
    if (event.tagIds.isEmpty) {
      add(ClearDreamFilter());
      return;
    }
    emit(DreamJournalLoading());
    try {
      final dreams = await _repository.getDreamsByTags(event.tagIds);
      emit(DreamJournalLoaded(
        dreams,
        activeTagIds: event.tagIds,
        activeTagNames: event.tagNames,
      ));
    } catch (e) {
      emit(DreamJournalError(e.toString()));
    }
  }

  Future<void> _onFilterByCharacters(
    FilterByCharacters event,
    Emitter<DreamJournalState> emit,
  ) async {
    if (event.characterIds.isEmpty) {
      add(ClearDreamFilter());
      return;
    }
    emit(DreamJournalLoading());
    try {
      final dreams =
          await _repository.getDreamsByCharacters(event.characterIds);
      emit(DreamJournalLoaded(
        dreams,
        activeCharacterIds: event.characterIds,
        activeCharacterNames: event.characterNames,
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

  Future<void> _onSearchDreams(
    SearchDreams event,
    Emitter<DreamJournalState> emit,
  ) async {
    try {
      final query = event.query.trim();
      if (query.isEmpty) {
        final dreams = await _repository.getDreams();
        emit(DreamJournalLoaded(dreams));
        return;
      }
      final dreams = await _repository.getDreams(searchQuery: query);
      emit(DreamJournalLoaded(dreams, activeSearchQuery: query));
    } catch (e) {
      emit(DreamJournalError(e.toString()));
    }
  }
}
