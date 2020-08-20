import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildRatingBar(ThemeData theme, BuildContext context, double rating){
  var stars = <Widget>[];

  for(var i = 1; i <= 5; i++){
    var color = i <= rating / 2 ? theme.accentColor : Colors.grey;
    var star = Icon(
      Icons.star,
      color: color,
      size: 18.0,
    );
    stars.add(star);
  }
  return Row(mainAxisSize: MainAxisSize.min, children: stars);
}