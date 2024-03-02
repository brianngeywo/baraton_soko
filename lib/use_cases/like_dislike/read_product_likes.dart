import 'package:baraton_soko/databases/like_dislike_db.dart';
import 'package:baraton_soko/models/like_dislike_model.dart';
import 'package:baraton_soko/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadProductLikesUseCase {
  final LikeDisLikeDatabase _database;

  ReadProductLikesUseCase(this._database);

  Future<List<LikeDislikeTable>> readProductLikes({required String productId}) async {
    final result=  await _database.readProductLikes(productId: productId);
    var likes = result.map((e) => LikeDislikeTable.fromMap(e.data())).toList();
    return likes;
  }
}
