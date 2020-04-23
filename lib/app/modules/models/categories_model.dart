class CategoriesModel {
  final String id;
  final String name;

  CategoriesModel({
    this.id,
    this.name,
  });

  CategoriesModel.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
