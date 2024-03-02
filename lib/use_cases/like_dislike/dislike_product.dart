import 'package:baraton_soko/databases/like_dislike_db.dart';

class DislikeProductUseCase {

  final LikeDisLikeDatabase _database;

  DislikeProductUseCase(this._database);

  Future<void> dislikeProduct({required String productId, required String userId}) async {
    await _database.dislikeProduct(productId: productId, userId: userId);
  }
}