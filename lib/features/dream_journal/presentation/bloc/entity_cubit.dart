import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/app_database.dart';
import '../../data/repositories/dream_entity_repository.dart';

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------

class EntityState {
  const EntityState({
    this.tags = const [],
    this.characters = const [],
    this.loading = true,
  });

  final List<DreamTag> tags;
  final List<DreamCharacter> characters;
  final bool loading;

  EntityState copyWith({
    List<DreamTag>? tags,
    List<DreamCharacter>? characters,
    bool? loading,
  }) =>
      EntityState(
        tags: tags ?? this.tags,
        characters: characters ?? this.characters,
        loading: loading ?? this.loading,
      );
}

// ---------------------------------------------------------------------------
// Cubit
// ---------------------------------------------------------------------------

class EntityCubit extends Cubit<EntityState> {
  EntityCubit({required DreamEntityRepository repository})
      : _repository = repository,
        super(const EntityState()) {
    _tagsSubscription = _repository.watchAllTags().listen((tags) {
      emit(state.copyWith(tags: tags, loading: false));
    });
    _charactersSubscription =
        _repository.watchAllCharacters().listen((characters) {
      emit(state.copyWith(characters: characters, loading: false));
    });
  }

  final DreamEntityRepository _repository;
  late final StreamSubscription<List<DreamTag>> _tagsSubscription;
  late final StreamSubscription<List<DreamCharacter>> _charactersSubscription;

  /// Find or create a tag by name+color, returns the persisted tag.
  Future<DreamTag> findOrCreateTag(String name, String color) =>
      _repository.findOrCreateTag(name, color);

  Future<List<DreamTag>> searchTags(String query) =>
      _repository.searchTags(query);

  Future<List<DreamCharacter>> searchCharacters(String query) =>
      _repository.searchCharacters(query);

  /// Create a new character. Returns the new character's ID.
  Future<int> createCharacter({
    required String name,
    String? description,
    bool isRealPerson = false,
    String? archetypeTag,
  }) =>
      _repository.insertCharacter(DreamCharactersCompanion.insert(
        name: name,
        description: Value(description),
        isRealPerson: Value(isRealPerson),
        archetypeTag: Value(archetypeTag),
      ));

  @override
  Future<void> close() {
    _tagsSubscription.cancel();
    _charactersSubscription.cancel();
    return super.close();
  }
}
