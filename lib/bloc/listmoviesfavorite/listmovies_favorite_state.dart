import 'package:equatable/equatable.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/local/response/movies_favorite_entity.dart';

abstract class ListMoviesFavoriteState extends Equatable {
  const ListMoviesFavoriteState();

  @override
  List<Object> get props => [];
}

class InitialListMoviesFavoriteState extends ListMoviesFavoriteState {}

class ListMoviesFavoriteLoading extends ListMoviesFavoriteState {}

class ListMoviesFavoriteError extends ListMoviesFavoriteState {
  final String errorMessage;

  const ListMoviesFavoriteError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() =>
      'Movies Favorite List Failure ->> message : $errorMessage';
}

class ListMoviesFavoriteHasData extends ListMoviesFavoriteState {
  final List<MoviesFavoriteEntity> listMoviesFavorite;

  const ListMoviesFavoriteHasData({this.listMoviesFavorite});

  @override
  List<Object> get props => [listMoviesFavorite];
}
