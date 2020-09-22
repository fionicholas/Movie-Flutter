import 'package:movie_bloc_retrofit/data/moviesfavorite/local/movies_dao.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/local/response/movies_favorite_entity.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/movies_favorite_data_source.dart';

class MoviesFavoriteRepository extends MovieFavoriteDataSource {
  final moviesDao = MoviesDao();

  @override
  Future addMoviesFavorite(MoviesFavoriteEntity moviesFavoriteEntity) {
    return moviesDao.addMoviesFavorite(moviesFavoriteEntity);
  }

  @override
  Future deleteMoviesFavorite(int id) {
    return moviesDao.deleteMoviesFavorite(id);
  }

  @override
  Future getAllMoviesFavorite({String query}) {
    return moviesDao.getMovieFavorite(query:  query);
  }

  @override
  Future getMoviesFavoriteById({int id}) {
    return moviesDao.getMoviesFavoriteById(id: id);
  }

}