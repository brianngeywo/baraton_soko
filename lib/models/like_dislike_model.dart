class LikeDislikeTable {
  final String id;
  final String userId;
  final String productId;
  final bool liked;

  const LikeDislikeTable({
    required this.id,
    required this.userId,
    required this.productId,
    required this.liked,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'userId': this.userId,
      'productId': this.productId,
      'liked': this.liked,
    };
  }

  factory LikeDislikeTable.fromMap(Map<String, dynamic> map) {
    return LikeDislikeTable(
      id: map['id'],
      userId: map['userId'],
      productId: map['productId'],
      liked: map['liked'],
    );
  }
}
