
import 'package:dio/dio.dart';
import 'package:movie_bloc_retrofit/data/remote/movie_api_client.dart';
import 'package:movie_bloc_retrofit/data/movie_data_source.dart';
import 'package:movie_bloc_retrofit/model/crew.dart';
import 'package:movie_bloc_retrofit/model/movie_result.dart';

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
