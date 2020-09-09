import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // image
                Container(
                  width: 150.0 / 3,
                  height: 150.0  / 3,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal : 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              height: 30.0,
                              width: 60,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              height: 30.0,
                              width: 60,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 12.0,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 12.0,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 12.0,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          itemCount: 6,
        ),
      ),
    );
  }
}