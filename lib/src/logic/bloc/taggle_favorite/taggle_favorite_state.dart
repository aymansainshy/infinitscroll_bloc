part of 'taggle_favorite_bloc.dart';

class TaggleFavoriteState extends Equatable {
  final Post post;

  TaggleFavoriteState({this.post});

  TaggleFavoriteState copyWith({Post post}) {
    return TaggleFavoriteState(
      post: post ?? this.post,
    );
  }

  @override
  List<Object> get props => [post];
}
