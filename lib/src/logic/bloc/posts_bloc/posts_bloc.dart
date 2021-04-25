import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinit_scroll/src/data/models/post_model.dart';
import 'package:infinit_scroll/src/data/repositories/posts_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({this.postsRepository}) : super(PostsInitial());

  final PostsRepository postsRepository;

  int page = 1;
  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    final currentState = state;

    if (event is FetchPosts && !_hasReachedMax(state)) {
      if (currentState is PostsInitial) {
        yield PostsInProgress();
        List<Post> posts = await postsRepository.fetchPosts(page);
        yield PostsLoadedSuccess(posts: posts, noMoreData: posts.isEmpty);
      }
    }
    if (event is FetchMorePosts && !_hasReachedMax(state)) {
      if (currentState is PostsLoadedSuccess) {
        page++;
        List<Post> posts = await postsRepository.fetchPosts(page);

        yield posts.isEmpty
            ? currentState.copyWith(noMoreData: posts.isEmpty)
            : PostsLoadedSuccess(
                posts: currentState.posts + posts,
                noMoreData: posts.isEmpty,
              );
      }
    }
  }
}

bool _hasReachedMax(PostsState state) =>
    state is PostsLoadedSuccess && state.noMoreData;