part of 'taggle_favorite_bloc.dart';

class TaggleFavoriteState {
  final String error;

  TaggleFavoriteState({
    this.error,
  });

  TaggleFavoriteState copyWith({String error}) {
    return TaggleFavoriteState(
      error: error ?? this.error,
    );
  }
}
