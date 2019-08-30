import 'package:flutter/material.dart';
import 'package:flutter_app/model/categoryMeal.dart' as mealsCategory;
import 'package:flutter_app/screen/food.dart';
import 'package:flutter_app/screen/foodlist.dart';
import 'package:flutter_app/view/DetailMeal.dart';

class CategoryNameView extends StatelessWidget {
  final List<mealsCategory.CategoryMeal> categoryMeals;

  CategoryNameView({Key key, this.categoryMeals}) : super(key: key);

  Card getCategoryMeals(mealsCategory.CategoryMeal categoryMeal) {
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(10.0),
      child: Container(
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                image: new NetworkImage(categoryMeal.imageMeal),
                fit: BoxFit.cover,
              )),
          child: new Center(
            child: Text(
              categoryMeal.nameMeal,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: categoryMeals.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => DetailMealApp(detailName: categoryMeals[index].nameMeal,)
            ));
          },
          child: getCategoryMeals(categoryMeals[index]),
        );
      },
    );
  }
}
