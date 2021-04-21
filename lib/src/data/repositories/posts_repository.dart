import 'package:infinit_scroll/src/data/models/post.dart';
import 'package:infinit_scroll/src/data/services/services.dart';

class PostsRepository {
  PostsRepository(this.services);
  final Reader services;

  Future<List<Post>> fetchPosts(int page) async {
    final List<dynamic> loadedPosts = await services.fetchData(page);
    final List<Post> posts = [];
    loadedPosts.map((post) => posts.add(Post.fromJson(post))).toList();
    return posts;
  }
}
