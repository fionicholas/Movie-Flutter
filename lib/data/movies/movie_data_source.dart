import 'package:movie_bloc_retrofit/data/movies/remote/response/movie_result.dart';
import 'remote/response/crew.dart';

abstract class MovieDataSource {
  Future<MovieResult> getMoviePopular();
  Future<MovieResult> getMovieUpComing();
  Future<ResultCrew> getCrewMovie(String id);
}