import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/ui/home/components/list_movie_popular.dart';
import 'package:movie_bloc_retrofit/ui/home/components/list_movie_upcoming.dart';

class MovieHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Catalogue"),
      ),
      body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            child: Column(
              children: <Widget> [
                ListMoviePopular(),
                ListMovieUpComing(),
                SizedBox(
                  height: 16.0,
                )
              ],
            ),
          )),
    );
  }
}
