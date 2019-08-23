class Category {
  final String idCategory;
  final String nameCategory;
  final String imageCategory;
  final String descCategory;

  Category._(
      {this.idCategory,
      this.nameCategory,
      this.imageCategory,
      this.descCategory});

  factory Category.fromJson(Map<String, dynamic> json) {
    return new Category._(
        idCategory: json['idCategory'],
        nameCategory: json['strCategory'],
        imageCategory: json['strCategoryThumb'],
        descCategory: json['strCategoryDescription']);
  }
}
