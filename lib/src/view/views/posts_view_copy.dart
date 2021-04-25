import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_scroll/src/logic/bloc/posts_bloc/posts_bloc.dart';

class PostsView2 extends StatefulWidget {
  @override
  _PostsViewState createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView2> {
  final ScrollController _scrollController = ScrollController();
  var isLoading = false;

  void _setUpScrollController(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          BlocProvider.of<PostsBloc>(context).add(FetchMorePosts());
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsBloc>(context).add(FetchPosts());
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
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 2000)).then((_) {
          context.read<PostsBloc>().add(FetchPosts(isRefresh: true));
        });
      },
      child: Container(
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsInProgress) {
              return _circularProgressIndicator();
            }

            if (state is PostsLoadedSuccess) {
              return ListView.separated(
                itemCount: state.posts.length + 1,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (index < state.posts.length) {
                    return ListTile(
                      title: Text(
                        "${state.posts[index].id} - ${state.posts[index].title}",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(state.posts[index].body),
                    );
                  } else {
                    if (state is PostsLoadedSuccess && !state.noMoreData) {
                      Timer(Duration(milliseconds: 30), () {
                        _scrollController.jumpTo(
                          _scrollController.position.maxScrollExtent,
                        );
                      });
                      return _circularProgressIndicator();
                    }
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "No more data ... ",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }
                },
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _circularProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
