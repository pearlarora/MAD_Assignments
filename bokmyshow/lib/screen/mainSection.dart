import 'dart:ui';

import 'package:bookmyshow/models/m_poster.dart';
import 'package:bookmyshow/repo/poster_operation.dart';
import 'package:flutter/material.dart';

class mainsection extends StatelessWidget {
  // const mainsection({Key? key}) : super(key: key);

  List<m_poster> posts = [];
  mainsection() {
    poster_operation opr = poster_operation.getInstance();
    posts = opr.getposter();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: _card(),
        ),
      ),

      // child: ListView.builder(
      // itemBuilder:()),
    );
  }

  List<Widget> _card() {
    List<Widget> lst = posts.map((post) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
        child: Card(
          elevation: 2,
          child: Column(
            //?? errror - whe use expanded and flex
            children: <Widget>[
              Container(
                //movie poster
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      post.m_URL,
                      // "https://i.ebayimg.com/images/g/lVMAAOSwhQheYrmk/s-l300.jpg",
                      // "https://prakashgowda.files.wordpress.com/2017/05/hindi-medium-movie-poster.jpg",
                      // "https://d2kektcjb0ajja.cloudfront.net/images/posts/feature_images/000/000/072/large-1466557422-feature.jpg?1466557422",
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      bottom: 20,
                      right: 15,
                      child: Container(
                        height: 75,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.black45),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        post.like_perc + "%",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  post.votes + " votes",
                                  // overflow: TextOverflow.ellipsis, // to skip the content that overflows
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 15,
                                      color: Colors.white),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //movie info
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, top: 8.0, right: 19.0, left: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                post.m_name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  post.m_lang,
                                  style: TextStyle(fontWeight: FontWeight.w200),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3, bottom: 3, right: 6, left: 6),
                                    child: Text(
                                      "2D",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        color: Colors.grey, width: 0.9),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                SizedBox(
                                  width: 35,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("BOOK"),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFE335C),
                          onPrimary: Colors.white,
                          // shadowColor: Colors.red,
                          elevation: 1,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
    return lst;
  }
}
