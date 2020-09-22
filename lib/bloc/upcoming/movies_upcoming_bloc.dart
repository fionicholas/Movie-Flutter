import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_event.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_state.dart';
import 'package:movie_bloc_retrofit/data/movies/movie_data_source.dart';

class MovieUpComingBloc extends Bloc<MoviesUpComingEvent, MoviesUpComingState> {
  final MovieDataSource repository;

  MovieUpComingBloc({@required this.repository})
      : super(InitialMoviesUpComingState());

  @override
  Stream<MoviesUpComingState> mapEventToState(
      MoviesUpComingEvent event) async* {
    if (event is LoadUpComingMovie) {
      yield* _mapLoadUpComingMovieToState();
    }
  }

  Stream<MoviesUpComingState> _mapLoadUpComingMovieToState() async* {
    try {
      yield MoviesUpComingLoading();
      var movies = await repository.getMovieUpComing();
      if (movies?.results?.isEmpty ?? true) {
        yield MoviesUpComingNoData("Movies Not Found");
      } else {
        yield MoviesUpComingHasData(movies.results);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield MoviesUpComingNoInternetConnection("No Internet Connection");
      } else if (e.type == DioErrorType.DEFAULT) {
        yield MoviesUpComingNoInternetConnection("No Internet Connection");
      } else {
        yield MoviesUpComingError(e.toString());
      }
    }
  }
}
