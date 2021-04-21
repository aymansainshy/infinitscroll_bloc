import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_scroll/src/data/models/post.dart';
import 'package:infinit_scroll/src/logic/cubit/posts_cubit.dart';

class PostsView extends StatefulWidget {
  @override
  _PostsViewState createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  final ScrollController _scrollController = ScrollController();
  var isLoading = false;

  void _setUpScrollController(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          BlocProvider.of<PostsCubit>(context).loadPosts();
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsCubit>(context).loadPosts();
    _setUpScrollController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinit Posts"),
      ),
      body: _builPostList(),
    );
  }

  Widget _builPostList() {
    return Container(
      child: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is PostsInProgress && state.isFirstFetch) {
            return _circularProgressIndicator();
          }

          if (state is PostsFaild) {
            return _errorText(state.error.toString());
          }

          List<Post> posts = [];

          if (state is PostsInProgress) {
            posts = state.oldPost;
            isLoading = true;
          } else if (state is PostsLoaded) {
            posts = state.posts;
          }

          return ListView.separated(
            itemCount: posts.length + (isLoading ? 1 : 0),
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (index < posts.length) {
                return ListTile(
                  title: Text(
                    "${posts[index].id} - ${posts[index].title}",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(posts[index].body),
                );
              } else {
                Timer(Duration(milliseconds: 30), () {
                  _scrollController.jumpTo(
                    _scrollController.position.maxScrollExtent,
                  );
                });
                return _circularProgressIndicator();
              }
            },
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
              thickness: 1,
            ),
          );
        },
      ),
    );
  }

  Widget _errorText(String error) {
    return Center(
      child: Text(error),
    );
  }

  Widget _circularProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
