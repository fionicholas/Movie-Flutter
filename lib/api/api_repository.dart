
import 'package:movie_bloc_retrofit/api/api_provider.dart';
import 'package:movie_bloc_retrofit/api/base_provider.dart';
import 'package:movie_bloc_retrofit/model/movie_result.dart';

class ApiRepository extends BaseProvider{

  ApiProvider _apiProvider = ApiProvider();

  @override
  Future<MovieResult> getMoviePopular() => _apiProvider.getMoviePopular();

  @override
  Future<MovieResult> getMovieUpComing() => _apiProvider.getMovieUpComing();

}