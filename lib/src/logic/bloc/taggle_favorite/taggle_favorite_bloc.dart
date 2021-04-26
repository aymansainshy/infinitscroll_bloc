import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinit_scroll/src/data/models/post_model.dart';

part 'taggle_favorite_event.dart';
part 'taggle_favorite_state.dart';

class TaggleFavoriteBloc
    extends Bloc<TaggleFavoriteEvent, TaggleFavoriteState> {
  TaggleFavoriteBloc() : super(TaggleFavoriteState());

  bool oldFav;
  @override
  Stream<TaggleFavoriteState> mapEventToState(
    TaggleFavoriteEvent event,
  ) async* {
    try {
      if (event is SetFavotrite) {
        oldFav = event.post.isFavorite;
        print("Before - ${event.post.id} - $oldFav");
        yield TaggleFavoriteState(isFavorite: !oldFav);
        await event.post.toggleFavorite();
        // yield TaggleFavoriteState(isFavorite: event.post.isFavorite);
        print("After1 - ${event.post.id} - ${event.post.isFavorite}");
      }
    } on Exception catch (e) {
      print("Error - $e");
      if (event is SetFavotrite) {
        print("AfterError - ${event.post.id} - ${event.post.isFavorite}");
        yield state.copyWith(isFavorite: oldFav, error: e.toString());
      }
    }
  }
}
