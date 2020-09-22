import 'package:dio/dio.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_event.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/data/movies/movie_data_source.dart';

class MoviePopularBloc extends Bloc<MoviesPopularEvent, MoviesPopularState> {
  final MovieDataSource repository;

  MoviePopularBloc({@required this.repository})
      : super(InitialMoviesPopularState());

  @override
  Stream<MoviesPopularState> mapEventToState(MoviesPopularEvent event) async* {
    if (event is LoadPopularMovie) {
      yield* _mapLoadPopularMovieToState();
    }
  }

  Stream<MoviesPopularState> _mapLoadPopularMovieToState() async* {
    try {
      yield MoviesPopularLoading();
      var movies = await repository.getMoviePopular();
      if (movies?.results?.isEmpty ?? true) {
        yield MoviesPopularNoData("Movies Not Found");
      } else {
        yield MoviesPopularHasData(movies.results);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield MoviesPopularNoInternetConnection("No Internet Connection");
      } else if (e.type == DioErrorType.DEFAULT) {
        yield MoviesPopularNoInternetConnection("No Internet Connection");
      } else {
        yield MoviesPopularError(e.toString());
      }
    }
  }
}
