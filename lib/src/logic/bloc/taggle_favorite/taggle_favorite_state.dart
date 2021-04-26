part of 'taggle_favorite_bloc.dart';

class TaggleFavoriteState {
  final bool isFavorite;
  final String error;

  TaggleFavoriteState({
    this.isFavorite = false,
    this.error,
  });

  TaggleFavoriteState copyWith({bool isFavorite, String error}) {
    return TaggleFavoriteState(
      isFavorite: isFavorite ?? this.isFavorite,
      error: error ?? this.error,
    );
  }
}
