import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/model/movies_item.dart';
import 'package:movie_bloc_retrofit/ui/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details_movie';
  @override
  Widget build(BuildContext context) {
    final MoviesItem movie = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Body(movie: movie),
    );
  }
}
