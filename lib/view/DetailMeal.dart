import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/model/detailMeal.dart' as detailMealss;
import 'package:flutter_app/network.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailMealApp extends StatelessWidget {
  final String detailName;
  static String tag = 'detail-page';

  DetailMealApp({Key key, @required this.detailName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: detailMeal());
  }

  Widget detailMeal() {
    return new FutureBuilder(
        future: fetchDetailMeal(detailName),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new DetailMealsView(
                  detailmeals: snapshot.data,
                )
              : new Center(child: new CircularProgressIndicator());
        });
  }
}

void launcherUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class DetailMealsView extends StatelessWidget {
  final List<detailMealss.DetailMeal> detailmeals;

  DetailMealsView({Key key, this.detailmeals}) : super(key: key);

  ListView getDetailsFood(detailMealss.DetailMeal detailMeal) {
    return new ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Card(
              elevation: 5.0,
              color: Colors.transparent,
              margin: EdgeInsets.all(10.0),
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: new NetworkImage(detailMeal.imageMeal),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: Card(
                elevation: 5.0,
                child: Center(
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.amber,
                    child: Icon(
                      Icons.fastfood,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          child: Text(
            detailMeal.nameMeal,
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Instruction",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  detailMeal.instructionMeal,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          child: Text(
            "See More on: ",
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.redAccent,
                    child: MaterialButton(
                      onPressed: () {
                        launcherUrl(detailMeal.linkYoutubeMeal);
                      },
                      child: Text(
                        "Yotube",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(5.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue,
                  child: MaterialButton(
                    onPressed: () {
                      launcherUrl(detailMeal.linkSourceMeal);
                    },
                    child: Text(
                      "Source",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return getDetailsFood(detailmeals[0]);
  }
}
