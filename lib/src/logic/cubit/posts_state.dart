part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class PostsInProgress extends PostsState {
  final List<Post> oldPost;
  final bool isFirstFetch;

  PostsInProgress({
    this.oldPost,
    this.isFirstFetch = false,
  });

  @override
  List<Object> get props => [oldPost, isFirstFetch];
}

class PostsLoaded extends PostsState {
  final List<Post> posts;

  PostsLoaded({this.posts});

  @override
  List<Object> get props => [posts];
}

class PostsFaild extends PostsState {
  final String error;

  PostsFaild(this.error);

  @override
  List<Object> get props => [error];
}
