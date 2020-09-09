import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/ui/home/components/list_movie_popular.dart';
import 'package:movie_bloc_retrofit/ui/home/components/list_movie_upcoming.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget> [
              ListMoviePopular(),
              SizedBox(
                height: 16.0,
              ),
              ListMovieUpComing(),
              SizedBox(
                height: 16.0,
              )
            ],
          ),
        ));
  }
}
