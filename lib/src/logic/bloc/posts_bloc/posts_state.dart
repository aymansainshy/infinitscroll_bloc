part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class PostsInProgress extends PostsState {}

class PostsLoadedSuccess extends PostsState {
  final List<Post> posts;
  final bool noMoreData;

  PostsLoadedSuccess({this.posts, this.noMoreData = false});

  PostsLoadedSuccess copyWith({List<Post> posts, bool noMoreData}) {
    return PostsLoadedSuccess(
      posts: posts ?? this.posts,
      noMoreData: noMoreData ?? this.noMoreData,
    );
  }

  @override
  List<Object> get props => [posts, noMoreData];
}
