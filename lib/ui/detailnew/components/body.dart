import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';
import 'package:movie_bloc_retrofit/ui/detailnew/components/backdrop_rating.dart';
import 'package:movie_bloc_retrofit/ui/detailnew/components/cast_crew.dart';
import 'package:movie_bloc_retrofit/ui/detailnew/components/overview.dart';
import 'package:movie_bloc_retrofit/ui/detailnew/components/title_date_favorite.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/chip_genre_movies.dart';

class Body extends StatefulWidget {
  const Body({Key key, @required this.movie, this.scaffoldKey}) : super(key: key);

  final MoviesItem movie;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackDropRating(size: size, movie: widget.movie),
          SizedBox(height: 20,),
          TitleReleaseDateAndFavorite(moviesItem : widget.movie, scaffoldKey: widget.scaffoldKey,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.movie.genreIds
                    .take(3)
                    .map(buildGenreChip)
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Overview(moviesItem: widget.movie,),
          CastCrew(id: widget.movie.id.toString(),)
        ],
      ),
    );
  }
}
