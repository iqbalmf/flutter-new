class LatestMeal {
  final String mealId;
  final String mealName;
  final String mealImage;

  LatestMeal({this.mealId, this.mealName, this.mealImage});

  factory LatestMeal.fromJson(Map<String, dynamic> json) {
    return new LatestMeal(
        mealId: json['idMeal'],
        mealName: json['strMeal'],
        mealImage: json['strMealThumb']);
  }
}
