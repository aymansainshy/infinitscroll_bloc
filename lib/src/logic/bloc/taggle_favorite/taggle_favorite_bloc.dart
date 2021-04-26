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
    try {
      if (event is SetFavotrite) {
        print("Before - ${event.post.id} - ${event.post.isFavorite}");
        event.post.toggleFavorite();
        yield TaggleFavoriteState();

        await Future.delayed(Duration(milliseconds: 500), () {
          print("Http://Favorite Done ..");
          throw Exception();
        });

        print("After - ${event.post.id} - ${event.post.isFavorite}");
        // yield TaggleFavoriteState(isFavorite: event.post.isFavorite);
        /// We don't need to listen to [TaggleFavoriteState] value so we aren't yield to Ui
      }
    } on Exception catch (e) {
      print("Error - $e");
      if (event is SetFavotrite) {
        event.post.toggleFavorite();
        print("AfterError - ${event.post.id} - ${event.post.isFavorite}");
        yield state.copyWith(error: e.toString());
        // yield TaggleFavoriteState(error: e.toString()); also update the UI
      }
    }
  }
}
