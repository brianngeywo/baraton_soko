import 'package:baraton_soko/databases/product_db.dart';
import 'package:baraton_soko/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadSingleProductUseCase {
  final ProductsDatabase _database;

  ReadSingleProductUseCase(this._database);

  Future<ProductModel> getSingleProduct({required String productId}) async {
    final result = await _database.getSingleProduct(productId: productId);
    var product = ProductModel.fromMap(result.data()!);
    return product;
  }
}