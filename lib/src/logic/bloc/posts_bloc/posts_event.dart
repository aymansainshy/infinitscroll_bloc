part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class FetchPosts extends PostsEvent {
  final bool isRefresh;

  FetchPosts({this.isRefresh = false});
}

class FetchMorePosts extends PostsEvent {}

// class ToggleFavorite extends PostsEvent {
//   final int id;

//   ToggleFavorite({this.id});

//    @override
//   List<Object> get props => [id];
// }
