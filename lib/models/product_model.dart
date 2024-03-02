class ProductModel {
  final String id;
  final String title;
  final String description;
  final String categoryId;
  final String imageUrl;
  final String vendorId;
  final String price;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.imageUrl,
    required this.vendorId,
    required this.price,
  });




  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'categoryId': this.categoryId,
      'imageUrl': this.imageUrl,
      'vendorId': this.vendorId,
      'price': this.price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      categoryId: map['categoryId'],
      imageUrl: map['imageUrl'],
      vendorId: map['vendorId'],
      price: map['price'],
    );
  }
}
