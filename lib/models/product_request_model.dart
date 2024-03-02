class ProductRequestModel {
  final String id;
  final String productId;
  final String userId;

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'productId': this.productId,
      'userId': this.userId,
    };
  }

  factory ProductRequestModel.fromMap(Map<String, dynamic> map) {
    return ProductRequestModel(
      id: map['id'],
      productId: map['productId'],
      userId: map['userId'],
    );
  }

  const ProductRequestModel({
    required this.id,
    required this.productId,
    required this.userId,
  });
}