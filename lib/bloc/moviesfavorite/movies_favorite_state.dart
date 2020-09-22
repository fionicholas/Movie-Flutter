import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/local/response/movies_favorite_entity.dart';

abstract class MoviesFavoriteState extends Equatable {
  final String message;
  final MoviesFavoriteEntity moviesFavoriteEntity;
  final bool isFavorite;

  const MoviesFavoriteState(
      {this.message, this.moviesFavoriteEntity, this.isFavorite});

  @override
  List<Object> get props => [];
}

class InitialMoviesFavoriteState extends MoviesFavoriteState {}

class MoviesFavoriteError extends MoviesFavoriteState {
  final String errorMessage;

  const MoviesFavoriteError(this.errorMessage);

  List<Object> get props => [errorMessage];

  @override
  String toString() => 'Movies Favorite No Data (message : $errorMessage)';
}

class MoviesFavoriteHasData extends MoviesFavoriteState {
  const MoviesFavoriteHasData(
      {@required MoviesFavoriteEntity moviesFavoriteEntity, bool isFavorite})
      : super(
            moviesFavoriteEntity: moviesFavoriteEntity, isFavorite: isFavorite);
}

class MoviesFavoriteSuccess extends MoviesFavoriteState {
  MoviesFavoriteSuccess({@required String successMessage})
      : super(message: successMessage);
}
