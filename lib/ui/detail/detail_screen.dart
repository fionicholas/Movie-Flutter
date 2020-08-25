import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/model/movies_item.dart';
import 'package:movie_bloc_retrofit/ui/utils/ErrorImage.dart';
import 'package:movie_bloc_retrofit/ui/utils/LoadingIndicator.dart';
import 'package:movie_bloc_retrofit/ui/utils/chip_genre_movies.dart';
import 'package:movie_bloc_retrofit/ui/utils/rating_bar.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail_movie';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final MoviesItem args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2,
            imageUrl:
                "https://image.tmdb.org/t/p/original/${args.backdropPath}",
            placeholder: (context, url) => LoadingIndicator(),
            errorWidget: (context, url, error) => ErrorImage(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CachedNetworkImage(
                    height: 90.0,
                    width: 90.0,
                    imageUrl:
                        "https://image.tmdb.org/t/p/w185/${args.posterPath}",
                    placeholder: (context, url) => LoadingIndicator(),
                    errorWidget: (context, url, error) => ErrorImage(),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        args.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      buildRatingBar(theme, context, args.voteAverage),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: args.genreIds
                                .take(3)
                                .map(buildGenreChip)
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              args.overview,
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: RaisedButton.icon(
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              },
              label: Text('Back', style: TextStyle(color: Colors.white),),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
