import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/moviesfavorite/movies_favorite_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/moviesfavorite/movies_favorite_event.dart';
import 'package:movie_bloc_retrofit/bloc/moviesfavorite/movies_favorite_state.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/snackbar.dart';

class TitleReleaseDateAndFavorite extends StatefulWidget {
  const TitleReleaseDateAndFavorite(
      {Key key, @required this.moviesItem, this.scaffoldKey})
      : super(key: key);
  final MoviesItem moviesItem;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _TitleReleaseDateAndFavoriteState createState() =>
      _TitleReleaseDateAndFavoriteState();
}

class _TitleReleaseDateAndFavoriteState
    extends State<TitleReleaseDateAndFavorite> {
  String convertDateFromString(String strDate) {
    DateTime date = DateTime.parse(strDate);
    return formatDate(date, [
      dd,
      ' ',
      MM,
      ' ',
      yyyy,
    ]);
  }

  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    context.bloc<MoviesFavoriteBloc>().add(GetMoviesFavoriteById(
        moviesFavoriteEntity: widget.moviesItem.toFavoriteMovie()));
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.moviesItem.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 8),
                Text(
                  convertDateFromString(widget.moviesItem.releaseDate),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
                width: 64,
                height: 64,
                child: BlocListener<MoviesFavoriteBloc, MoviesFavoriteState>(
                  listenWhen: (previousState, state) {
                    return state is MoviesFavoriteSuccess;
                  },
                  listener: (context, state) {
                    context.bloc<MoviesFavoriteBloc>().add(
                        GetMoviesFavoriteById(
                            moviesFavoriteEntity:
                                widget.moviesItem.toFavoriteMovie()));
                  },
                  child: BlocBuilder<MoviesFavoriteBloc, MoviesFavoriteState>(
                      builder: (context, state) {
                    if (state is MoviesFavoriteHasData) {
                      if (state.moviesFavoriteEntity?.id != null) {
                        _isFavorite = true;
                      } else {
                        _isFavorite = false;
                      }
                      return _buildButtonFavorite();
                    } else if (state is MoviesFavoriteError) {
                      return Container(
                        child: Text(state.errorMessage),
                      );
                    }
                    return Container(
                      child: Text(""),
                    );
                  }),
                )),
          )
        ],
      ),
    );
  }

  Widget _buildButtonFavorite() {
    if (_isFavorite) {
      return FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.pinkAccent,
          onPressed: () {
            setState(() => _isFavorite = false);
            widget.scaffoldKey.currentState
                .showSnackBar(snackBar('Removed from Favorite!'));
            context.bloc<MoviesFavoriteBloc>().add(DeleteMoviesFavorite(
                moviesFavoriteEntity: widget.moviesItem.toFavoriteMovie()));
          },
          child: Icon(
            Icons.favorite,
            size: 28,
            color: Colors.white,
          ));
    } else {
      return FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.pinkAccent,
          onPressed: () {
            setState(() => _isFavorite = true);
            widget.scaffoldKey.currentState
                .showSnackBar(snackBar('Add To Favorite!'));
            context.bloc<MoviesFavoriteBloc>().add(AddMoviesFavorite(
                moviesFavoriteEntity: widget.moviesItem.toFavoriteMovie()));
          },
          child: Icon(
            Icons.favorite_border,
            size: 28,
            color: Colors.white,
          ));
    }
  }
}
