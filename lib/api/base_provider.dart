import 'package:movie_bloc_retrofit/model/movie_result.dart';

abstract class BaseProvider {
  Future<MovieResult> getMoviePopular();
}