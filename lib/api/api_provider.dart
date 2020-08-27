
import 'package:dio/dio.dart';
import 'package:movie_bloc_retrofit/api/api_client.dart';
import 'package:movie_bloc_retrofit/api/base_provider.dart';
import 'package:movie_bloc_retrofit/model/movie_result.dart';

class ApiProvider extends BaseProvider {
  Dio _dio = Dio();
  ApiClient _apiClient;

  var apiKey = "PASTE_YOUR_API_KEY";

  ApiProvider() {
    _dio = Dio();
    _apiClient = ApiClient(_dio);
  }

  @override
  Future<MovieResult> getMoviePopular() {
    return _apiClient.getMoviePopular(apiKey);
  }

  @override
  Future<MovieResult> getMovieUpComing() {
    return _apiClient.getMovieUpComing(apiKey);
  }

}
