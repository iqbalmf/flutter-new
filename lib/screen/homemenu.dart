import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/LatestView.dart';
import 'package:flutter_app/network.dart';
import 'package:flutter_app/view/CategoryView.dart';

class SecondPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Recipe",
      home: Secondpage(),
    );
  }
}

class Secondpage extends StatefulWidget {
  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text("Menu Meals"),
        ),
        body: ListView(
          children: <Widget>[
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