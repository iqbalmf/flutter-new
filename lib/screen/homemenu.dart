import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/LatestView.dart';
import 'package:flutter_app/network.dart';
import 'package:flutter_app/view/CategoryView.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  static String tag = "home-page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSlide = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          automaticallyImplyLeading: false,
          title: new Center(child: new Text("Menu Meals")),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: imageCarousell(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentSlide == index ? Colors.amberAccent : Colors.blueGrey,
                  ),
                );
              }),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Latest Meal",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            Container(
              height: 100.0,
              child: listLatestMeal(),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Meal Categories",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            Container(height: 600.0, child: listCategory()),
          ],
        ));
  }

  Widget imageCarousell() {
    return new CarouselSlider(
      height: 200.0,
      initialPage: 0,
      autoPlay: true,
      reverse: false,
      enlargeCenterPage: true,
      enableInfiniteScroll: true,
      autoPlayInterval: Duration(seconds: 8),
      autoPlayAnimationDuration: Duration(milliseconds: 2000),
      scrollDirection: Axis.horizontal,
      onPageChanged: (index) {
        setState(() {
          currentSlide = index;
        });
      },
      items: imgList.map((imgUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.network(
                imgUrl,
                fit: BoxFit.fill,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget listLatestMeal() {
    return new FutureBuilder(
        future: fetchLatestMeal(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new LatestView(latest: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        });
  }

  Widget listCategory() {
    return new FutureBuilder(
        future: fetchCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new CategoryView(category: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        });
  }
}
