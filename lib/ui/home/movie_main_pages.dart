import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/movies_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/movies_event.dart';
import 'package:movie_bloc_retrofit/bloc/movies_state.dart';
import 'package:movie_bloc_retrofit/ui/shimmer_movies.dart';
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
    BlocProvider.of<MovieBloc>(context).add(LoadPopularMovie());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Main"),
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
            _itemPopular(context),
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
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 1.8,
          child: BlocBuilder<MovieBloc, MoviesState>(
            builder: (context, state) {
              if (state is MoviesHasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movieList.length,
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
              } else if (state is MoviesLoading) {
                return ShimmerMovies();
              } else if (state is MoviesError) {
                return Container(
                  child: Center(
                    child: Text(state.errorMessage),
                  ),
                );
              } else if (state is MoviesNoData) {
                return Container(
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              } else if (state is MoviesNoInternetConnection) {
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
