import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/listmoviesfavorite/listmovies_favorite_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/listmoviesfavorite/listmovies_favorite_event.dart';
import 'package:movie_bloc_retrofit/data/moviesfavorite/local/response/movies_favorite_entity.dart';
import 'package:movie_bloc_retrofit/ui/detailnew/detail_new_screen.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/ErrorImage.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/LoadingIndicator.dart';
import 'package:movie_bloc_retrofit/ui/utils/ext/common_ext.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/rating_bar.dart';

class CardListFavorite extends StatefulWidget {
  const CardListFavorite({Key key, this.listMovieFavorite}) : super(key: key);

  final List<MoviesFavoriteEntity> listMovieFavorite;

  @override
  _CardListFavoriteState createState() => _CardListFavoriteState();
}

class _CardListFavoriteState extends State<CardListFavorite> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: ListView.builder(
          itemCount: widget.listMovieFavorite.length,
          itemBuilder: (context, index) {
            MoviesFavoriteEntity movies = widget.listMovieFavorite[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, DetailNewScreen.routeName,
                      arguments: movies.toMovie()).then((value) => setState(() {
                    context.bloc<ListMoviesFavoriteBloc>().add(GetListMoviesFavorite());
                  }));
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
                                  buildRatingBar(theme, context, double.parse(movies.voteAverage)),
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