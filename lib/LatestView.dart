import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/model/latestmeal.dart' as latestMeal;

class LatestView extends StatelessWidget {
  final List<latestMeal.LatestMeal> latest;

  LatestView({Key key, this.latest}) : super(key: key);

  Card getLatestView(latestMeal.LatestMeal latestMeal) {
    return new Card(
      elevation: 1.5,
      margin: EdgeInsets.all(10.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.network(
            latestMeal.mealImage,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
            latestMeal.mealName,
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: latest.length,
        itemBuilder: (context, index) {
          return getLatestView(latest[index]);
        });
  }
}
