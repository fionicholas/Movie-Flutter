import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/ui/upcoming/components/body.dart';

class MovieUpComingPages extends StatefulWidget {
  static const routeName = '/upcoming_movie';
  @override
  _MovieUpComingPagesState createState() => _MovieUpComingPagesState();
}

class _MovieUpComingPagesState extends State<MovieUpComingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Up Coming'),
      ),
      body: Body()
    );
  }
}
