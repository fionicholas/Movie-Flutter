import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/ui/home/components/body.dart';

class MovieMainPages extends StatefulWidget {
  @override
  _MovieMainPagesState createState() => _MovieMainPagesState();
}

class _MovieMainPagesState extends State<MovieMainPages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Catalogue"),
      ),
      body: Body()
    );
  }
}
