import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/model/movies_item.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail_movie';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final MoviesItem args = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
        body: SingleChildScrollView(physics: ClampingScrollPhysics(),
    )
    );
  }
}
