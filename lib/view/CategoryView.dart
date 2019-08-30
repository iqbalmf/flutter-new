import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/model/category.dart' as categoryMeal;
import 'package:flutter_app/screen/foodlist.dart';
import 'package:flutter_app/screen/homemenu.dart';

class CategoryView extends StatelessWidget {
  final List<categoryMeal.Category> category;

  CategoryView({Key key, this.category}) : super(key: key);

  Card getCategoryList(categoryMeal.Category category) {
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
          SizedBox(
            height: 15.0,
          ),
          Text(
            category.nameCategory,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
        crossAxisCount: 3,
        physics: ScrollPhysics(), // to disable GridView's scrolling
        shrinkWrap: true,
        children: List.generate(category.length, (index) {
          return GestureDetector(
            onTap: () {
              print(category[index].nameCategory);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FoodListApp(categoryName: category[index].nameCategory)));
            },
            child: getCategoryList(category[index]),
          );
        }));
  }
}
