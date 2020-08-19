
import 'package:dio/dio.dart';
import 'package:movie_bloc_retrofit/api/base_provider.dart';
import 'package:movie_bloc_retrofit/bloc/movies_event.dart';
import 'package:movie_bloc_retrofit/bloc/movies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final BaseProvider repository;

  MovieBloc({@required this.repository}) : super(InitialMoviesState());

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if(event is LoadPopularMovie){
      yield* _mapLoadPopularMovieToState();
    }
  }

  Stream<MoviesState> _mapLoadPopularMovieToState() async* {
    try{
      yield MoviesLoading();
      var movies = await repository.getMoviePopular();
      if(movies?.results?.isEmpty ?? true){
        yield MoviesNoData("Movies Not Found");
      }else {
        yield MoviesHasData(movies.results);
      }
    } on DioError catch (e) {
      if(e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield MoviesNoInternetConnection("No Internet Connection");
      }else if(e.type == DioErrorType.DEFAULT) {
        yield MoviesNoInternetConnection("No Internet Connection");
      }else {
        yield MoviesError(e.toString());
      }
    }
  }

}