import 'package:baraton_soko/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsDatabase {
  Future<QuerySnapshot<Map<String, dynamic>>> getAllProducts() async => await productsCollection.get();

  Future<DocumentSnapshot<Map<String, dynamic>>> getSingleProduct({required String productId}) {
    return productsCollection.doc(productId).get();
  }

  getAllProductsSortByLikes() async {}

  getAllLatestProductsSortByCreated() async {}

  Future<String> sendProductrequest({required String productId, required String userId}) async {
    String id = "";
    await productRequestsCollection.doc("$userId$productId").set({
      'id': "$userId$productId",
      'productId': productId,
      'userId': userId,
    }).whenComplete(() => id = "$userId$productId");
    print(id);
    return id;
  }

  Stream<int> checkProductRequestStatus({required String productId, required String userId})  {
    final result =  productRequestsCollection
        .where("productId", isEqualTo: productId)
        .where("userId", isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
    return result;
  }
}
