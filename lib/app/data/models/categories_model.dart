class CategoriesModel {
  int? id;
  String? name;

  CategoriesModel({
    this.id,
    this.name,
  });

  factory CategoriesModel.fromJson(dynamic json) {
    if (json == null) {
      return CategoriesModel();
    }

    return CategoriesModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
