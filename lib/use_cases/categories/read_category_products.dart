import 'package:baraton_soko/databases/category_db.dart';
import 'package:baraton_soko/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadCategoryProductsUseCase {
  final CategoriesDatabase _database;

  ReadCategoryProductsUseCase(this._database);

  Future<List<ProductModel>> getAllSingleCategoryProducts({required String category}) async {
    final result = await _database.getAllSingleCategoryProducts(category: category);
    var products = result.docs.map((e) => ProductModel.fromMap(e.data())).toList();
    return products;
  }
}
