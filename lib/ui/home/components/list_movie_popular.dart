import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_event.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_state.dart';
import 'package:movie_bloc_retrofit/ui/detailnew/detail_new_screen.dart';
import 'package:movie_bloc_retrofit/ui/popular/movie_popular_pages.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/LoadingIndicator.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/card_movie_home.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';

class ListMoviePopular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviePopularBloc>(context).add(LoadPopularMovie());
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal :8.0),
                child: Text(
                  'Popular Movie',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  size: 16.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MoviePopularPages.routeName);
                },
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 1.8,
          child: BlocBuilder<MoviePopularBloc, MoviesPopularState>(
            builder: (context, state) {
              if (state is MoviesPopularHasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movieList.length > 5 ? 5 : state.movieList.length,
                    itemBuilder: (BuildContext context, int index) {
                      MoviesItem movie = state.movieList[index];
                      return CardMovieHome(
                          image: movie.posterPath,
                          title: movie.title,
                          voteAverage: movie.voteAverage,
                          onTap: (){
                            Navigator.pushNamed(
                                context,
                                DetailNewScreen.routeName,
                                arguments: movie
                            );
                          }
                      );
                    });
              } else if (state is MoviesPopularLoading) {
                return LoadingIndicator();
              } else if (state is MoviesPopularError) {
                return Container(
                  child: Center(
                    child: Text(state.errorMessage),
                  ),
                );
              } else if (state is MoviesPopularNoData) {
                return Container(
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              } else if (state is MoviesPopularNoInternetConnection) {
                return Container(
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              } else {
                return Container(
                  child: Center(
                    child: Text("Error"),
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
