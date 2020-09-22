import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';
import 'package:movie_bloc_retrofit/ui/detail/detail_screen.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/chip_genre_movies.dart';

class BuildListMovie extends StatelessWidget {
  const BuildListMovie({Key key, this.listMovie}) : super(key: key);

  final List<MoviesItem> listMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: listMovie.length,
          itemBuilder: (context, index) {
            MoviesItem movies = listMovie[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
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
                            child: Image.network(
                                'https://image.tmdb.org/t/p/w185/${movies.posterPath}'),
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
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: movies.genreIds
                                      .take(3)
                                      .map(buildGenreChip)
                                      .toList(),
                                ),
                              ),
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
