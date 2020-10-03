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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CrewMovieBloc(repository: MovieRepository()),
        ),
        BlocProvider<ListMoviesFavoriteBloc>(
          create: (context) => ListMoviesFavoriteBloc(
              moviesFavoriteRepository: MoviesFavoriteRepository()),
        ),
        BlocProvider(
          create: (context) => MoviesFavoriteBloc(
              moviesFavoriteRepository: MoviesFavoriteRepository()),
        ),
        BlocProvider<MoviePopularBloc>(
          create: (context) => MoviePopularBloc(repository: MovieRepository()),
        ),
        BlocProvider<MovieUpComingBloc>(
          create: (context) => MovieUpComingBloc(repository: MovieRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Movie App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          MoviePopularPages.routeName: (context) => MoviePopularPages(),
          MovieUpComingPages.routeName: (context) => MovieUpComingPages(),
          DetailScreen.routeName: (context) => DetailScreen(),
          DetailNewScreen.routeName: (context) => DetailNewScreen(),
        },
        home: MovieMainPages(),
      ),
    );
  }
}
