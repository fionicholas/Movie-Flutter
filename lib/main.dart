import 'package:movie_bloc_retrofit/api/api_repository.dart';
import 'package:movie_bloc_retrofit/bloc/movie_bloc_observer.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_bloc.dart';
import 'package:movie_bloc_retrofit/ui/detail/detail_screen.dart';
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
      title: 'Flutter Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        MoviePopularPages.routeName: (context) => BlocProvider(
              create: (context) {
                return MoviePopularBloc(repository: ApiRepository());
              },
              child: MoviePopularPages(),
            ),
        MovieUpComingPages.routeName: (context) => BlocProvider(
          create: (context) {
            return MovieUpComingBloc(repository: ApiRepository());
          },
          child: MovieUpComingPages(),
        ),
        DetailScreen.routeName : (context) => DetailScreen(),
      },
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MoviePopularBloc>(
            create: (context) {
              return MoviePopularBloc(repository: ApiRepository());
            },
          ),
          BlocProvider<MovieUpComingBloc>(
            create: (context) {
              return MovieUpComingBloc(repository: ApiRepository());
            },
          ),
        ],
        child: MovieMainPages(),
      ),
    );
  }
}
