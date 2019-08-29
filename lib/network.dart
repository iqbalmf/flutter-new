import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_app/model/category.dart' as category;
import 'package:flutter_app/model/latestmeal.dart' as latest;
import 'package:flutter_app/model/categoryMeal.dart' as categoryMeals;
import 'package:flutter_app/model/detailMeal.dart' as detailMeals;

Future<List<category.Category>> fetchCategory() async {
  List<category.Category> list;
  final String url = "https://www.themealdb.com/api/json/v1/1/categories.php";
  final response = await http.get(Uri.encodeFull(url));
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var rest = data["categories"] as List;
    list = rest
        .map<category.Category>((json) => category.Category.fromJson(json))
        .toList();
  }
  return list;
}

Future<List<categoryMeals.CategoryMeal>> fetchCategoryMeals(
    String categoryName) async {
  List<categoryMeals.CategoryMeal> listCategoryName;
  final String url =
      "https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName";
  final response = await http.get(Uri.encodeFull(url));
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var rest = data["meals"] as List;
    listCategoryName =
        rest.map((json) => categoryMeals.CategoryMeal.fromJson(json)).toList();
  }
  return listCategoryName;
}

Future<List<latest.LatestMeal>> fetchLatestMeal() async {
  List<latest.LatestMeal> listLatestMeal;
  final String url = "https://www.themealdb.com/api/json/v1/1/latest.php";
  final response = await http.get(Uri.encodeFull(url));
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var rest = data['meals'] as List;
    listLatestMeal =
        rest.map((json) => latest.LatestMeal.fromJson(json)).toList();
  }
  return listLatestMeal;
}

Future<List<detailMeals.DetailMeal>> fetchDetailMeal(String nameMeal) async {
  List<detailMeals.DetailMeal> detailMeal;
  final String url =
      "https://www.themealdb.com/api/json/v1/1/search.php?s=$nameMeal";
  final response = await http.get(Uri.encodeFull(url));
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var rest = data['meals'] as List;
    detailMeal =
        rest.map((json) => detailMeals.DetailMeal.fromJson(json)).toList();
  }
  return detailMeal;
}
