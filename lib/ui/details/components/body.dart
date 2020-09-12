import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/model/movies_item.dart';
import 'package:movie_bloc_retrofit/ui/details/components/backdrop_rating.dart';
import 'package:movie_bloc_retrofit/ui/details/components/cast_crew.dart';
import 'package:movie_bloc_retrofit/ui/details/components/overview.dart';
import 'package:movie_bloc_retrofit/ui/details/components/title_date_favorite.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/chip_genre_movies.dart';

class Body extends StatelessWidget {
  const Body({Key key, @required this.movie}) : super(key: key);

  final MoviesItem movie;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackDropRating(size: size, movie: movie),
          SizedBox(height: 20,),
          TitleReleaseDateAndFavorite(moviesItem : movie),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: movie.genreIds
                    .take(3)
                    .map(buildGenreChip)
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Overview(moviesItem: movie,),
          CastCrew(id: movie.id.toString(),)
        ],
      ),
    );
  }
}
