import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/ui/favorite/movies_favorite_screen.dart';
import 'package:movie_bloc_retrofit/ui/home/movie_home_screen.dart';

class MovieMainPages extends StatefulWidget {
  @override
  _MovieMainPagesState createState() => _MovieMainPagesState();
}

class _MovieMainPagesState extends State<MovieMainPages> {

  final MovieHomeScreen _movie = MovieHomeScreen();
  final MoviesFavoriteScreen _favorite = MoviesFavoriteScreen();

  Widget _showPages = new MovieHomeScreen();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0 :
        return _movie;
        break;
      case 1 :
        return _favorite;
        break;
      default :
        return new Container(
          child: Text('Page Not Found',
            style: TextStyle(fontSize: 30.0),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: _showPages,),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: Colors.blue,
        items: <Widget>[
          Icon(Icons.movie, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _showPages = _pageChooser(index);
          });
        },
      ),
    );
  }
}
