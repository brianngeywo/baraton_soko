class CategoryModel {
  final String categoryId;
  final String name;

  const CategoryModel({
    required this.categoryId,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'categoryId': this.categoryId,
      'name': this.name,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId'],
      name: map['name'],
    );
  }
}