import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/ui/upcoming/components/body.dart';

class MovieUpComingPages extends StatelessWidget {
  static const routeName = '/upcoming_movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie Up Coming'),
        ),
        body: Body());
  }
}
