class CategoryMeal {
  String idMeal;
  String nameMeal;
  String imageMeal;

  CategoryMeal._({this.idMeal, this.nameMeal, this.imageMeal});

  factory CategoryMeal.fromJson(Map<String, dynamic> json) {
    return new CategoryMeal._(
        idMeal: json['idMeal'],
        nameMeal: json['strMeal'],
        imageMeal: json['strMealThumb']);
  }
}
