import 'package:baraton_soko/use_cases/like_dislike/dislike_product.dart';
import 'package:baraton_soko/use_cases/like_dislike/like_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LikeDislikesProvider with ChangeNotifier {
  final LikeProductUseCase _likeProductUseCase;
  final DislikeProductUseCase _dislikeProductUseCase;

  LikeDislikesProvider({required LikeProductUseCase likeProductUseCase, required DislikeProductUseCase dislikeProductUseCase})
      : _likeProductUseCase = likeProductUseCase,
        _dislikeProductUseCase = dislikeProductUseCase;

  Future<void> likeDislikePost({required String productId, required bool isLike}) async {
    if (isLike) {
      await _likeProductUseCase.likeProduct(productId: productId, userId: FirebaseAuth.instance.currentUser!.uid);
    } else {
      await _dislikeProductUseCase.dislikeProduct(productId: productId, userId: FirebaseAuth.instance.currentUser!.uid);
    }
    notifyListeners();
  }
}
