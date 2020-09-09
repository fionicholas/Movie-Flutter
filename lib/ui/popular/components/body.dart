import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_event.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_state.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/build_list_movie.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/shimmer_movies.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviePopularBloc>(context).add(LoadPopularMovie());
    return BlocBuilder<MoviePopularBloc, MoviesPopularState>(
        builder: (context, state) {
      if (state is MoviesPopularHasData) {
        return BuildListMovie(listMovie: state.movieList);
      } else if (state is MoviesPopularLoading) {
        return ShimmerMovies();
      } else if (state is MoviesPopularNoData) {
        return Center(
          child: Text(state.message),
        );
      } else if (state is MoviesPopularError) {
        return Center(child: Text(state.errorMessage));
      } else if (state is MoviesPopularNoInternetConnection) {
        return Center(
          child: Text(state.message),
        );
      } else {
        return Center(child: Text(''));
      }
    });
  }
}
