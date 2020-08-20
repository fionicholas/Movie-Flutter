import 'package:dio/dio.dart';
import 'package:movie_bloc_retrofit/model/movie_result.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl : "https://api.themoviedb.org/3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("movie/popular")
  Future<MovieResult> getMoviePopular(@Query("api_key") String apiKey);

  @GET("movie/upcoming")
  Future<MovieResult> getMovieUpComing(@Query("api_key") String apiKey);
}