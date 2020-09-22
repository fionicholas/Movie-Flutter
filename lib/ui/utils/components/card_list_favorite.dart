import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/local/response/movies_favorite_entity.dart';
import 'package:movie_bloc_retrofit/ui/detailnew/detail_new_screen.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/ErrorImage.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/LoadingIndicator.dart';
import 'package:movie_bloc_retrofit/ui/utils/ext/common_ext.dart';

class CardListFavorite extends StatelessWidget {
  const CardListFavorite({Key key, this.listMovieFavorite}) : super(key: key);

  final List<MoviesFavoriteEntity> listMovieFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: listMovieFavorite.length,
          itemBuilder: (context, index) {
            MoviesFavoriteEntity movies = listMovieFavorite[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, DetailNewScreen.routeName,
                      arguments: movies.toMovie());
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
                            child: CachedNetworkImage( imageUrl : "${movies.posterPath.toUrlImage}",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: LoadingIndicator(),
                              ),
                              errorWidget: (context, url, error) => ErrorImage(),),
                          ),
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
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                movies.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, right: 16.0, bottom: 8.0),
                              child: Row(
                                children: [
                                  Icon( Icons.star, color: Colors.yellow,),
                                  SizedBox(width: 4,),
                                  Text(movies.voteAverage.toString())
                                ],
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8.0, right: 8.0),
                              child: Text(
                                movies.overview,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
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