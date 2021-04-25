part of 'taggle_favorite_bloc.dart';

abstract class TaggleFavoriteEvent extends Equatable {
  const TaggleFavoriteEvent();

  @override
  List<Object> get props => [];
}

class SetFavotrite extends TaggleFavoriteEvent {
  final Post post;

  SetFavotrite({this.post});
}
