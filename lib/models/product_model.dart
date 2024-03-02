class ProductModel {
  final String id;
  final String title;
  final String description;
  final String categoryId;
  final String imageUrl;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'categoryId': this.categoryId,
      'imageUrl': this.imageUrl,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      categoryId: map['categoryId'],
      imageUrl: map['imageUrl'],
    );
  }
}
