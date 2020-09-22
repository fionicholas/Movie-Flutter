import 'package:movie_bloc_retrofit/data/moviesfavorite/local/response/movies_favorite_entity.dart';

abstract class MovieFavoriteDataSource {
  Future getAllMoviesFavorite({String query});
  Future getMoviesFavoriteById({int id});
  Future addMoviesFavorite(MoviesFavoriteEntity moviesFavoriteEntity);
  Future deleteMoviesFavorite(int id);
}