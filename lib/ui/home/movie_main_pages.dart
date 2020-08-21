import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_event.dart';
import 'package:movie_bloc_retrofit/bloc/popular/movies_popular_state.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_event.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_state.dart';
import 'package:movie_bloc_retrofit/ui/popular/movie_popular_pages.dart';
import 'package:movie_bloc_retrofit/ui/upcoming/movie_upcoming_pages.dart';
import 'package:movie_bloc_retrofit/ui/utils/LoadingIndicator.dart';
import 'package:movie_bloc_retrofit/model/movies_item.dart';
import 'package:movie_bloc_retrofit/ui/utils/card_movie_home.dart';

class MovieMainPages extends StatefulWidget {
  @override
  _MovieMainPagesState createState() => _MovieMainPagesState();
}


class _MovieMainPagesState extends State<MovieMainPages> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviePopularBloc>(context).add(LoadPopularMovie());
    BlocProvider.of<MovieUpComingBloc>(context).add(LoadUpComingMovie());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
      ),
      body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget> [
            _itemPopular(context),
            SizedBox(
              height: 16.0,
            ),
            _itemUpComing(context),
            SizedBox(
              height: 16.0,
            )
          ],
        ),
      )),
    );
  }

  Widget _itemPopular(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Popular Movie',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
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

  Widget _itemUpComing(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Up Coming Movie',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  size: 16.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MovieUpComingPages.routeName);
                },
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 1.8,
          child: BlocBuilder<MovieUpComingBloc, MoviesUpComingState>(
            builder: (context, state) {
              if (state is MoviesUpComingHasData) {
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
                          }
                      );
                    });
              } else if (state is MoviesUpComingLoading) {
                return LoadingIndicator();
              } else if (state is MoviesUpComingError) {
                return Container(
                  child: Center(
                    child: Text(state.errorMessage),
                  ),
                );
              } else if (state is MoviesUpComingNoData) {
                return Container(
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              } else if (state is MoviesUpComingNoInternetConnection) {
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
