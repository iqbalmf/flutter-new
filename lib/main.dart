import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/foodlist.dart';
import 'package:flutter_app/screen/homemenu.dart';
import 'package:flutter_app/screen/login.dart';
import 'package:flutter_app/view/DetailMeal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    FoodListApp.tag: (context) => FoodListApp(),
    DetailMealApp.tag: (context) => DetailMealApp(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Recipe",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: routes,
    );
  }
}
