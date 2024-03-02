import 'package:baraton_soko/databases/like_dislike_db.dart';

class LikeProductUseCase {
  final LikeDisLikeDatabase _database;

  LikeProductUseCase(this._database);

  Future<void> likeProduct({required String productId, required String userId}) async {
    await _database.likeProduct(productId: productId, userId: userId);
  }
}