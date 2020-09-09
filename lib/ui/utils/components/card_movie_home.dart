import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/ErrorImage.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/LoadingIndicator.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/rating_bar.dart';

class CardMovieHome extends StatelessWidget {
  final String image, title;
  final Function onTap;
  final double voteAverage;

  const CardMovieHome(
      {Key key, this.image, this.title, this.onTap, this.voteAverage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: CachedNetworkImage(
                    imageUrl: "https://image.tmdb.org/t/p/w185/$image",
                    height: MediaQuery.of(context).size.width / 1.8,
                    width: MediaQuery.of(context).size.width / 2.5,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => LoadingIndicator(),
                    errorWidget: (context, url, error) => ErrorImage(),
                  ),
                ),
              ),

              //Stack 2
              Container(
                height: MediaQuery.of(context).size.width / 1.8,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.98],
                        colors: [Colors.transparent, Colors.grey[900]])),
              ),

              //Stack 3
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  padding: EdgeInsets.only(left: 6.0, bottom: 5.0, right: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      buildRatingBar(theme, context, voteAverage),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
