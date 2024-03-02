import 'package:baraton_soko/databases/like_dislike_db.dart';
import 'package:baraton_soko/models/like_dislike_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadProductDislikesUseCase {

  final LikeDisLikeDatabase _database;

  ReadProductDislikesUseCase(this._database);

  Future<List<LikeDislikeModel>> readProductDislikes({required String productId}) async {
    final result = await _database.readProductDislikes(productId: productId);
    var dislikes = result.map((e) => LikeDislikeModel.fromMap(e.data())).toList();
    return dislikes;
  }
}