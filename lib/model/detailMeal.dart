class DetailMeal {
  final String idMeal;
  final String nameMeal;
  final String categoryMeal;
  final String instructionMeal;
  final String imageMeal;
  final String tagsMeal;
  final String linkYoutubeMeal;
  final String linkSourceMeal;

  DetailMeal(
      {this.idMeal,
      this.nameMeal,
      this.categoryMeal,
      this.instructionMeal,
      this.imageMeal,
      this.tagsMeal,
      this.linkSourceMeal,
      this.linkYoutubeMeal});

  factory DetailMeal.fromJson(Map<String, dynamic> json) {
    return new DetailMeal(
        idMeal: json['idMeal'],
        nameMeal: json['strMeal'],
        categoryMeal: json['strCategory'],
        instructionMeal: json['strInstructions'],
        imageMeal: json['strMealThumb'],
        tagsMeal: json['strTags'],
        linkYoutubeMeal: json['strYoutube'],
        linkSourceMeal: json['strSource']);
  }
}
