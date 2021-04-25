import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_scroll/src/data/api_services/posts_reader.dart';
import 'package:infinit_scroll/src/data/repositories/posts_repository.dart';
import 'package:infinit_scroll/src/logic/bloc/posts_bloc/posts_bloc.dart';
import 'package:infinit_scroll/src/view/views/posts_view_copy.dart';

void main() {
  runApp(MyApp(
    postsRepository: PostsRepository(PostsReader()),
  ));
}

class MyApp extends StatelessWidget {
  final PostsRepository postsRepository;

  const MyApp({Key key, this.postsRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => PostsBloc(postsRepository: postsRepository),
        child: PostsView2(),
      ),
    );
  }
}
