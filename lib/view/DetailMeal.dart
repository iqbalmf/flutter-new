import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/model/detailMeal.dart' as detailMealss;
import 'package:flutter_app/network.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: detailMeal()
    );
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

class DetailMealsView extends StatelessWidget {
  final List<detailMealss.DetailMeal> detailmeals;

  DetailMealsView({Key key, this.detailmeals}) : super(key: key);

  ListView getDetailsFood(detailMealss.DetailMeal detailMeal){
    return new ListView(
      children: <Widget>[
        Container(
          height: 200.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: new NetworkImage(detailMeal.imageMeal),
              fit: BoxFit.cover
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          child: Text(detailMeal.nameMeal,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30.0
          ),),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return getDetailsFood(detailmeals[0]);
  }
}
