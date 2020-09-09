import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_event.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_state.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/build_list_movie.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/shimmer_movies.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MovieUpComingBloc>(context).add(LoadUpComingMovie());
    return BlocBuilder<MovieUpComingBloc, MoviesUpComingState>(
        builder: (context, state) {
      if (state is MoviesUpComingHasData) {
        return BuildListMovie(listMovie: state.movieList);
      } else if (state is MoviesUpComingLoading) {
        return ShimmerMovies();
      } else if (state is MoviesUpComingNoData) {
        return Center(
          child: Text(state.message),
        );
      } else if (state is MoviesUpComingError) {
        return Center(child: Text(state.errorMessage));
      } else if (state is MoviesUpComingNoInternetConnection) {
        return Center(
          child: Text(state.message),
        );
      } else {
        return Center(child: Text(''));
      }
    });
  }
}
