import 'package:flutter/material.dart';
import 'package:movie_bloc_retrofit/model/movies_item.dart';
import 'package:date_format/date_format.dart';

class TitleReleaseDateAndFavorite extends StatelessWidget {
  const TitleReleaseDateAndFavorite({Key key, @required this.moviesItem})
      : super(key: key);
  final MoviesItem moviesItem;

  String convertDateFromString(String strDate){
    DateTime date = DateTime.parse(strDate);
    return formatDate(date, [dd, ' ', MM, ' ', yyyy,]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  moviesItem.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 8),
                Text(
                  convertDateFromString(moviesItem.releaseDate),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: SizedBox(
              width: 64, height: 64,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                color: Colors.pinkAccent,
                onPressed: () {},
                child: Icon(
                  Icons.favorite,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
