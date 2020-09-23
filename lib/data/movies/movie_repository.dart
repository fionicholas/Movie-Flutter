
import 'package:dio/dio.dart';
import 'package:movie_bloc_retrofit/data/movies/movie_data_source.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/movie_api_client.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/crew.dart';

import 'remote/response/movie_result.dart';

class MovieRepository extends MovieDataSource {
  Dio _dio = Dio();
  MovieApiClient _apiClient;

  var apiKey = "PASTE_YOUR_API_KEY";

  MovieRepository() {
    _dio = Dio();
    _apiClient = MovieApiClient(_dio);
  }

  @override
  Future<MovieResult> getMoviePopular() {
    return _apiClient.getMoviePopular(apiKey);
  }

  @override
  Future<MovieResult> getMovieUpComing() {
    return _apiClient.getMovieUpComing(apiKey);
  }

  @override
  Future<ResultCrew> getCrewMovie(String id) {
    return _apiClient.getCrewMovie(id, apiKey);
  }

}
