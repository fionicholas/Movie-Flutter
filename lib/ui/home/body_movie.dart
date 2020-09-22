import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/ui/home/components/list_movie_popular.dart';
import 'package:movie_bloc_retrofit/ui/home/components/list_movie_upcoming.dart';

class BodyMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          child: Column(
            children: <Widget> [
              ListMoviePopular(),
              SizedBox(
                height: 8.0,
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
