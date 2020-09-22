import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';
import 'package:movie_bloc_retrofit/ui/detailnew/components/body.dart';

class DetailNewScreen extends StatelessWidget {
  static const routeName = '/detail_new_movie';
  @override
  Widget build(BuildContext context) {
    final MoviesItem movie = ModalRoute.of(context).settings.arguments;
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: Body(movie: movie, scaffoldKey: scaffoldKey),
    );
  }
}
