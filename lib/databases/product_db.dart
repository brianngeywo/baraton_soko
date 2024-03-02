import 'package:baraton_soko/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsDatabase {
  Future<QuerySnapshot<Map<String, dynamic>>> getAllProducts() async => await productsCollection.get();

  Future<DocumentSnapshot<Map<String, dynamic>>> getSingleProduct({required String productId}) {
    return productsCollection.doc(productId).get();
  }

  getAllProductsSortByLikes() async {}

  getAllLatestProductsSortByCreated() async {}

  Future<void> sendProductrequest({required String productId, required String userId}) => productRequestsCollection.doc("$userId$productId").set({
        'id': "$userId$productId",
        'productId': productId,
        'userId': userId,
      });
}
