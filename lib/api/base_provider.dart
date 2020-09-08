import 'package:movie_bloc_retrofit/model/movie_result.dart';
import 'package:movie_bloc_retrofit/model/crew.dart';

abstract class BaseProvider {
  Future<MovieResult> getMoviePopular();
  Future<MovieResult> getMovieUpComing();
  Future<ResultCrew> getCrewMovie(String id);
}