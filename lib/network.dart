import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_app/model/category.dart' as prefix0;

Future<List<prefix0.Category>> fetchCategory() async {
  List<prefix0.Category> list;
  final String url = "https://www.themealdb.com/api/json/v1/1/categories.php";
  final response = await http.get(Uri.encodeFull(url));
  if(response.statusCode == 200){
    var data = json.decode(response.body);
    var rest = data["categories"] as List;
    list = rest.map<prefix0.Category>((json) => prefix0.Category.fromJson(json)).toList();
  }
  return list;
}
