import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';

class Overview extends StatelessWidget {
  const Overview({Key key, @required this.moviesItem}) : super(key: key);

  final MoviesItem moviesItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            moviesItem.overview,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey[600]),
          )
        ],
      ),
    );
  }
}
