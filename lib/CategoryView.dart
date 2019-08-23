import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/model/category.dart' as prefix0;

class CategoryView extends StatelessWidget {
  final List<prefix0.Category> category;

  CategoryView({Key key, this.category}) : super(key: key);

  Card getCategoryList(prefix0.Category category) {
    return new Card(
      elevation: 1.5,
      margin: EdgeInsets.all(10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.network(
            category.imageCategory,
          ),
          SizedBox(height: 15.0,),
          Text(
            category.nameCategory,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
        crossAxisCount: 3,
        children: List.generate(category.length, (index) {
          return getCategoryList(category[index]);
        }));
  }
}
