import 'package:baraton_soko/models/like_dislike_model.dart';
import 'package:baraton_soko/use_cases/like_dislike/dislike_product.dart';
import 'package:baraton_soko/use_cases/like_dislike/like_product.dart';
import 'package:baraton_soko/use_cases/like_dislike/read_product_dislikes.dart';
import 'package:baraton_soko/use_cases/like_dislike/read_product_likes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LikeDislikesProvider with ChangeNotifier {
  final LikeProductUseCase _likeProductUseCase;
  final DislikeProductUseCase _dislikeProductUseCase;
  final ReadProductLikesUseCase _readProductLikesUseCase;
  final ReadProductDislikesUseCase _readProductDislikesUseCase;

  LikeDislikesProvider({
    required LikeProductUseCase likeProductUseCase,
    required DislikeProductUseCase dislikeProductUseCase,
    required ReadProductLikesUseCase readProductLikesUseCase,
    required ReadProductDislikesUseCase readProductDislikesUseCase,
  })  : _likeProductUseCase = likeProductUseCase,
        _dislikeProductUseCase = dislikeProductUseCase,
        _readProductLikesUseCase = readProductLikesUseCase,
        _readProductDislikesUseCase = readProductDislikesUseCase;

  Future<void> likeDislikePost({required String productId, required bool isLike}) async {
    if (isLike) {
      await _likeProductUseCase.likeProduct(productId: productId, userId: FirebaseAuth.instance.currentUser!.uid);
    } else {
      await _dislikeProductUseCase.dislikeProduct(productId: productId, userId: FirebaseAuth.instance.currentUser!.uid);
    }
    notifyListeners();
  }
  Future<List<LikeDislikeTable>> readProductLikes(String productId) async {
  final result = await _readProductLikesUseCase.readProductLikes(productId: productId);
  return result;
  }

  Future<List<LikeDislikeTable>> readProductDislikes(String productId) async {
 final result = await _readProductDislikesUseCase.readProductDislikes(productId: productId);
 return result;
}
}
