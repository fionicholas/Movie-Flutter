import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/local/response/movies_favorite_entity.dart';

abstract class MoviesFavoriteEvent extends Equatable {
  final MoviesFavoriteEntity moviesFavoriteEntity;

  const MoviesFavoriteEvent({this.moviesFavoriteEntity});

  @override
  List<Object> get props => [moviesFavoriteEntity];
}

class GetMoviesFavoriteById extends MoviesFavoriteEvent {
  GetMoviesFavoriteById({MoviesFavoriteEntity moviesFavoriteEntity})
      : super(moviesFavoriteEntity: moviesFavoriteEntity);
}

class AddMoviesFavorite extends MoviesFavoriteEvent {
  AddMoviesFavorite({@required MoviesFavoriteEntity moviesFavoriteEntity})
      : super(moviesFavoriteEntity: moviesFavoriteEntity);
}

class DeleteMoviesFavorite extends MoviesFavoriteEvent {
  DeleteMoviesFavorite({@required MoviesFavoriteEntity moviesFavoriteEntity})
      : super(moviesFavoriteEntity: moviesFavoriteEntity);
}
