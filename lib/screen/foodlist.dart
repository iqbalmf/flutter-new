import 'package:flutter/material.dart';
import 'package:flutter_app/network.dart';
import 'package:flutter_app/view/CategoryNameView.dart';

class FoodListApp extends StatelessWidget {

  static String tag = "category-list";
  final String categoryName;

  FoodListApp({Key key, @required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(this.categoryName),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.amberAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: listNameOfCategory()
    );
  }

  Widget listNameOfCategory() {
    return new FutureBuilder(
      future: fetchCategoryMeals(categoryName),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new CategoryNameView(
                categoryMeals: snapshot.data,
              )
            : new Center(child: new CircularProgressIndicator());
      },
    );
  }
}
