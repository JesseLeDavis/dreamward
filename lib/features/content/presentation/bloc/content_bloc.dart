import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/app_database.dart';

// ---------------------------------------------------------------------------
// ContentBloc
// ---------------------------------------------------------------------------

// Events
abstract class ContentEvent {}

class LoadContentByType extends ContentEvent {
  LoadContentByType(this.contentType);
  final int contentType;
}

class ToggleFavoriteItem extends ContentEvent {
  ToggleFavoriteItem(this.itemId);
  final int itemId;
}

// States
abstract class ContentState {}

class ContentInitial extends ContentState {}

class ContentLoading extends ContentState {}

class ContentLoaded extends ContentState {
  ContentLoaded(this.items, this.contentType);
  final List<ContentItem> items;
  final int contentType;
}

class ContentError extends ContentState {
  ContentError(this.message);
  final String message;
}

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc(this._db) : super(ContentInitial()) {
    on<LoadContentByType>(_onLoadContentByType);
    on<ToggleFavoriteItem>(_onToggleFavorite);
  }

  final AppDatabase _db;
  StreamSubscription<List<ContentItem>>? _subscription;

  Future<void> _onLoadContentByType(
    LoadContentByType event,
    Emitter<ContentState> emit,
  ) async {
    emit(ContentLoading());
    await _subscription?.cancel();
    _subscription = null;

    await emit.onEach<List<ContentItem>>(
      _db.contentDao.watchContentByType(event.contentType),
      onData: (items) => emit(ContentLoaded(items, event.contentType)),
      onError: (error, _) => emit(ContentError(error.toString())),
    );
  }

  Future<void> _onToggleFavorite(
    ToggleFavoriteItem event,
    Emitter<ContentState> emit,
  ) async {
    try {
      await _db.contentDao.toggleFavorite(event.itemId);
      // The stream will auto-emit an updated ContentLoaded state.
    } catch (e) {
      // Non-fatal; current list remains intact.
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

// ---------------------------------------------------------------------------
// FavoritesCubit
// ---------------------------------------------------------------------------

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  FavoritesLoaded(this.items);
  final List<ContentItem> items;
}

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._db) : super(FavoritesInitial()) {
    _subscription = _db.contentDao.watchFavorites().listen(
      (items) => emit(FavoritesLoaded(items)),
      onError: (_) => emit(FavoritesLoaded([])),
    );
  }

  final AppDatabase _db;
  late final StreamSubscription<List<ContentItem>> _subscription;

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
