import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinit_scroll/src/data/models/post_model.dart';
import 'package:infinit_scroll/src/data/repositories/posts_repository.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({this.postsRepository}) : super(PostsInitial());

  final PostsRepository postsRepository;

  int page = 1;

  void loadPosts() {
    if (state is PostsInProgress) return;

    final currentState = state;

    List<Post> oldPosts = [];

    if (currentState is PostsLoaded) {
      oldPosts = currentState.posts;
    }

    emit(PostsInProgress(oldPost: oldPosts, isFirstFetch: page == 1));

    postsRepository.fetchPosts(page).then((newPost) {
      page++;

      final posts = (state as PostsInProgress).oldPost;
      posts.addAll(newPost);

      emit(PostsLoaded(posts: posts));
    });
  }
}
