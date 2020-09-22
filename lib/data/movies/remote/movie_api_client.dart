import 'package:dio/dio.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/crew.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/movie_result.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api_client.g.dart';

@RestApi(baseUrl : "https://api.themoviedb.org/3/")
abstract class MovieApiClient {
  factory MovieApiClient(Dio dio, {String baseUrl}) = _MovieApiClient;

  @GET("movie/popular")
  Future<MovieResult> getMoviePopular(@Query("api_key") String apiKey);

  @GET("movie/upcoming")
  Future<MovieResult> getMovieUpComing(@Query("api_key") String apiKey);

  @GET("movie/{id}/credits")
  Future<ResultCrew> getCrewMovie(@Path("id")String id, @Query("api_key") String apiKey);
}