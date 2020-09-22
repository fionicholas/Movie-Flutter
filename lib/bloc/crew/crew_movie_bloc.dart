import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/crew/crew_movie_event.dart';
import 'package:movie_bloc_retrofit/bloc/crew/crew_movie_state.dart';
import 'package:movie_bloc_retrofit/data/movies/movie_data_source.dart';

class CrewMovieBloc extends Bloc<CrewMovieEvent, CrewMovieState> {
  final MovieDataSource repository;

  CrewMovieBloc({@required this.repository}) : super(InitialCrewMovieState());

  @override
  Stream<CrewMovieState> mapEventToState(CrewMovieEvent event) async* {
    if (event is LoadCrewMovie) {
      yield* _mapLoadCrewMovieToState(event.id);
    }
  }

  Stream<CrewMovieState> _mapLoadCrewMovieToState(String id) async* {
    try {
      yield CrewMovieLoading();
      var crews = await repository.getCrewMovie(id);
      if (crews.crew.isEmpty) {
        yield CrewMovieNoData("Crew Not Found");
      } else {
        yield CrewMovieHasData(crews);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield CrewMovieNoInternetConnection("No Internet Connection");
      } else if (e.type == DioErrorType.DEFAULT) {
        yield CrewMovieNoInternetConnection("No Internet Connection");
      } else {
        yield CrewMovieError(e.toString());
      }
    }
  }
}
