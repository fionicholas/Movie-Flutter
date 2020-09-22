import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/ErrorImage.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/LoadingIndicator.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/chip_genre_movies.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/rating_bar.dart';

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
    var movieInformation = Column(
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
    );
    return Scaffold(
        body: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 3),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 1.8,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 2,
                    imageUrl:
                    "https://image.tmdb.org/t/p/original/${args.backdropPath}",
                    placeholder: (context, url) => LoadingIndicator(),
                    errorWidget: (context, url, error) => ErrorImage(),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 16.0,
                right: 16.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Hero(
                      tag: 'poster-${args.id}',
                      child: CachedNetworkImage(
                        height : MediaQuery.of(context).size.width / 2,
                        imageUrl:
                        "https://image.tmdb.org/t/p/w185/${args.posterPath}",
                        placeholder: (context, url) => LoadingIndicator(),
                        errorWidget: (context, url, error) => ErrorImage(),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(child: movieInformation),
                  ],
                ),
              ),
            ],
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
              shape: StadiumBorder(),
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
