import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/listmoviesfavorite/listmovies_favorite_event.dart';
import 'package:movie_bloc_retrofit/bloc/listmoviesfavorite/listmovies_favorite_state.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/local/response/movies_favorite_entity.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/movies_favorite_repository.dart';

class ListMoviesFavoriteBloc extends Bloc<ListMoviesFavoriteEvent, ListMoviesFavoriteState>{
  final MoviesFavoriteRepository moviesFavoriteRepository;

  ListMoviesFavoriteBloc({@required this.moviesFavoriteRepository}) : super(InitialListMoviesFavoriteState());

  @override
  Stream<ListMoviesFavoriteState> mapEventToState(ListMoviesFavoriteEvent event) async* {
    yield ListMoviesFavoriteLoading();
    if(event is GetListMoviesFavorite) {
      try {
        List<MoviesFavoriteEntity> listMoviesFavorite = await moviesFavoriteRepository.getAllMoviesFavorite(query: event.query);
        yield ListMoviesFavoriteHasData(listMoviesFavorite: listMoviesFavorite);
      }catch(e) {
        yield ListMoviesFavoriteError(e.toString());
      }
    }
  }
}