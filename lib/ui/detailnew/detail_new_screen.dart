import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/model/movies_item.dart';
import 'package:movie_bloc_retrofit/ui/detailnew/components/body.dart';

class DetailNewScreen extends StatelessWidget {
  static const routeName = '/detail_new_movie';
  @override
  Widget build(BuildContext context) {
    final MoviesItem movie = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Body(movie: movie),
    );
  }
}
