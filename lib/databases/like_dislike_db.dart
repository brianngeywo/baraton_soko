import 'package:baraton_soko/constants.dart';
import 'package:baraton_soko/models/like_dislike_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LikeDisLikeDatabase {
  // Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getSingleProductLikeCount(String productId) async {
  //   // get the count of likes and dislikes for a single product
  //   final likesDocs = await likeDislikesCollection.where("productId", isEqualTo: productId).where("liked", isEqualTo: true).get();
  //   return likesDocs.docs;
  // }
  //
  // Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getSingleProductDislikeCount(String productId) async {
  //   // get the count of likes and dislikes for a single product
  //   final dislikesDocs = await likeDislikesCollection.where("productId", isEqualTo: productId).where("liked", isEqualTo: false).get();
  //   return dislikesDocs.docs;
  // }

  dislikeProduct({required String productId, required String userId}) async {
    //check if there is anothe document with same productId and userId
    // await likeDislikesCollection.where("productId", isEqualTo: productId).where("userId", isEqualTo: userId).get().then((value) {
    //   if (value.docs.isEmpty) {
        // dislike a product
        likeDislikesCollection.doc("$userId+$productId").set({
          "id":"$userId$productId",
          "productId": productId,
          "userId": userId,
          "liked": false,
        });
    //   } else {
    //     // remove the dislike
    //     likeDislikesCollection.doc(value.docs.first.id).delete();
    //   }
    // });
  }

  Future<String> likeProduct({required String productId, required String userId}) async {
    //check if there is anothe document with same productId and userId
    // await likeDislikesCollection.where("productId", isEqualTo: productId).where("userId", isEqualTo: userId).get().then((value) {
    //   if (value.docs.isEmpty) {
        // like a product
    String id = "";
    await  likeDislikesCollection.doc("$userId+$productId").set({
          "id":"$userId$productId",
          "productId": productId,
          "userId": userId,
          "liked": true,
        }). whenComplete(() => id = "$userId$productId");
    return "$userId$productId";
      // } else {
      //   // remove the like
      //   likeDislikesCollection.doc(value.docs.first.id).delete();
      // }
    // });
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> readProductLikes({required String productId}) async {
    // get the count of likes for a single product
    final likesDocs = await likeDislikesCollection.where("productId", isEqualTo: productId).where("liked", isEqualTo: true).get();
    return likesDocs.docs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> readProductDislikes({required String productId}) async {
    // get the count of dislikes for a single product
    final dislikesDocs = await likeDislikesCollection.where("productId", isEqualTo: productId).where("liked", isEqualTo: false).get();
    return dislikesDocs.docs;
  }
}
