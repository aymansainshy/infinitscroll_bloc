import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinit_scroll/src/data/models/post_model.dart';

part 'taggle_favorite_event.dart';
part 'taggle_favorite_state.dart';

class TaggleFavoriteBloc
    extends Bloc<TaggleFavoriteEvent, TaggleFavoriteState> {
  TaggleFavoriteBloc() : super(TaggleFavoriteState());

  @override
  Stream<TaggleFavoriteState> mapEventToState(
    TaggleFavoriteEvent event,
  ) async* {
    if (event is SetFavotrite) {
      final currentState = state;
      currentState.post.toggleFavorite();
      yield TaggleFavoriteState(post: currentState.post);
    }
  }
}
