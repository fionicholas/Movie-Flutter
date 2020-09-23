import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/listmoviesfavorite/listmovies_favorite_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/listmoviesfavorite/listmovies_favorite_event.dart';
import 'package:movie_bloc_retrofit/bloc/listmoviesfavorite/listmovies_favorite_state.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/card_list_favorite.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/shimmer_movies.dart';

class MoviesFavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ListMoviesFavoriteBloc>(context)
        .add(GetListMoviesFavorite());
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Movies"),
      ),
      body: BlocBuilder<ListMoviesFavoriteBloc, ListMoviesFavoriteState>(
          builder: (context, state) {
        if (state is ListMoviesFavoriteHasData) {
          if (state.listMoviesFavorite.isEmpty) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.movie,
                  color: Colors.blue,
                  size: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Favorite Movies Not Found')
              ],
            ));
          } else {
            return CardListFavorite(listMovieFavorite: state.listMoviesFavorite);
          }
        } else if (state is ListMoviesFavoriteLoading) {
          return ShimmerMovies();
        } else if (state is ListMoviesFavoriteError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Center(child: Text(''));
        }
      }),
    );
  }
}
