import 'package:baraton_soko/databases/product_db.dart';
import 'package:baraton_soko/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadAllProductsUseCase {
  final ProductsDatabase _database;
  ReadAllProductsUseCase(this._database);
   Future<List<ProductModel>> getAllProducts() async {
    final result = await _database.getAllProducts();
    var products = result.docs.map((e) => ProductModel.fromMap(e.data())).toList();
    return products;
   }
}

class ReadAllProductsSortByLikesUseCase {
  final ProductsDatabase _database;
  ReadAllProductsSortByLikesUseCase(this._database);
  Future<List<ProductModel>> getAllProductsSortByLikes() async {
    final result = await _database.getAllProductsSortByLikes();
    var products = result.docs.map((e) => ProductModel.fromMap(e.data())).toList();
    return products;
  }
}

class ReadAllLatestProductsSortByCreatedUseCase {
  final ProductsDatabase _database;
  ReadAllLatestProductsSortByCreatedUseCase(this._database);
  Future<List<ProductModel>> getAllLatestProductsSortByCreated() async {
    final result = await _database.getAllLatestProductsSortByCreated();
    var products = result.docs.map((e) => ProductModel.fromMap(e.data())).toList();
    return products;
  }
}