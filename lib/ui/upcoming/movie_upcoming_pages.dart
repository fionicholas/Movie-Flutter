import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_event.dart';
import 'package:movie_bloc_retrofit/bloc/upcoming/movies_upcoming_state.dart';
import 'package:movie_bloc_retrofit/model/movies_item.dart';
import 'package:movie_bloc_retrofit/ui/detail/detail_screen.dart';
import 'package:movie_bloc_retrofit/ui/utils/chip_genre_movies.dart';
import 'package:movie_bloc_retrofit/ui/utils/shimmer_movies.dart';

class MovieUpComingPages extends StatefulWidget {
  static const routeName = '/upcoming_movie';
  @override
  _MovieUpComingPagesState createState() => _MovieUpComingPagesState();
}

class _MovieUpComingPagesState extends State<MovieUpComingPages> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieUpComingBloc>(context).add(LoadUpComingMovie());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Up Coming'),
      ),
      body: BlocBuilder<MovieUpComingBloc, MoviesUpComingState>(
          builder: (context, state){
            if(state is MoviesUpComingHasData){
              return BuildList(listMovieUpComing: state.movieList);
            }else if(state is MoviesUpComingLoading){
              return ShimmerMovies();
            }else if (state is MoviesUpComingNoData) {
              return Center(child: Text(state.message),);
            }
            else if(state is MoviesUpComingError){
              return Center(child: Text(state.errorMessage));
            }else if(state is MoviesUpComingNoInternetConnection){
              return Center(child: Text(state.message),);
            }
            else {
              return Center(child: Text(''));
            }
          }
      ),
    );
  }
}

class BuildList extends StatelessWidget {
  const BuildList({Key key, this.listMovieUpComing}) : super(key: key);

  final List<MoviesItem> listMovieUpComing;
  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView.builder(
          itemCount: listMovieUpComing.length,
          itemBuilder: (context, index) {
            MoviesItem movies = listMovieUpComing[index];
            return Padding(
              padding: const EdgeInsets.only(left :8.0, right : 8.0, bottom: 8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, DetailScreen.routeName,
                      arguments: movies);
                },
                child: Card(
                  elevation: 4.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Hero(
                              tag: 'poster-${movies.id}',
                              child: Image.network('https://image.tmdb.org/t/p/w185/${movies.posterPath}')),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top : 8.0),
                              child: Text(movies.title, style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical : 8.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: movies.genreIds.take(3).map(buildGenreChip).toList(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom : 8.0, right: 8.0),
                              child: Text(movies.overview, maxLines : 3 , overflow: TextOverflow.ellipsis,),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
