import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/moviesfavorite/movies_favorite_event.dart';
import 'package:movie_bloc_retrofit/bloc/moviesfavorite/movies_favorite_state.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/local/response/movies_favorite_entity.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/movies_favorite_repository.dart';

class MoviesFavoriteBloc
    extends Bloc<MoviesFavoriteEvent, MoviesFavoriteState> {
  final MoviesFavoriteRepository moviesFavoriteRepository;

  MoviesFavoriteBloc({@required this.moviesFavoriteRepository})
      : super(InitialMoviesFavoriteState());

  @override
  Stream<MoviesFavoriteState> mapEventToState(
      MoviesFavoriteEvent event) async* {
    if (event is GetMoviesFavoriteById) {
      try {
        MoviesFavoriteEntity moviesFavorite = await moviesFavoriteRepository.getMoviesFavoriteById(id: event.moviesFavoriteEntity?.id);
        yield MoviesFavoriteHasData(moviesFavoriteEntity: moviesFavorite, isFavorite: moviesFavorite?.id != null ? true : false);
      } catch (e) {
        yield MoviesFavoriteError(e.toString());
      }
    } else if (event is AddMoviesFavorite) {
      try {
        await moviesFavoriteRepository
            .addMoviesFavorite(event.moviesFavoriteEntity);
        yield MoviesFavoriteSuccess(
            successMessage:
                event.moviesFavoriteEntity.title + ' add to favorite');
      } catch (e) {
        yield MoviesFavoriteError(e.toString());
      }
    } else if (event is DeleteMoviesFavorite) {
      try {
        await moviesFavoriteRepository
            .deleteMoviesFavorite(event.moviesFavoriteEntity?.id);
        yield MoviesFavoriteSuccess(
            successMessage:
            event.moviesFavoriteEntity.title + ' removed from favorite');
      } catch (e) {
        yield MoviesFavoriteError(e.toString());
      }
    }
  }
}
