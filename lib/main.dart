import 'package:movie_bloc_retrofit/bloc/crew/crew_movie_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/listmoviesfavorite/listmovies_favorite_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/movie_bloc_observer.dart';
import 'package:movie_bloc_retrofit/bloc/moviesfavorite/movies_favorite_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_bloc.dart';
import 'package:movie_bloc_retrofit/data/movies/movie_repository.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/movies_favorite_repository.dart';
import 'package:movie_bloc_retrofit/ui/detail/detail_screen.dart';
import 'package:movie_bloc_retrofit/ui/detailnew/detail_new_screen.dart';
import 'package:movie_bloc_retrofit/ui/home/movie_main_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/ui/popular/movie_popular_pages.dart';
import 'package:movie_bloc_retrofit/ui/upcoming/movie_upcoming_pages.dart';

void main() {
  Bloc.observer = MovieBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        MoviePopularPages.routeName: (context) => BlocProvider(
              create: (context) {
                return MoviePopularBloc(repository: MovieRepository());
              },
              child: MoviePopularPages(),
            ),
        MovieUpComingPages.routeName: (context) => BlocProvider(
              create: (context) {
                return MovieUpComingBloc(repository: MovieRepository());
              },
              child: MovieUpComingPages(),
            ),
        DetailScreen.routeName: (context) => DetailScreen(),
        DetailNewScreen.routeName: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) {
                    return CrewMovieBloc(repository: MovieRepository());
                  },
                ),
                BlocProvider(
                  create: (context) {
                    return MoviesFavoriteBloc(
                        moviesFavoriteRepository: MoviesFavoriteRepository());
                  },
                ),
              ],
              child: DetailNewScreen(),
            ),
      },
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MoviePopularBloc>(
            create: (context) {
              return MoviePopularBloc(repository: MovieRepository());
            },
          ),
          BlocProvider<MovieUpComingBloc>(
            create: (context) {
              return MovieUpComingBloc(repository: MovieRepository());
            },
          ),
          BlocProvider<ListMoviesFavoriteBloc>(
            create: (context) {
              return ListMoviesFavoriteBloc(
                  moviesFavoriteRepository: MoviesFavoriteRepository());
            },
          ),
        ],
        child: MovieMainPages(),
      ),
    );
  }
}
