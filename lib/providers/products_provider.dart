import 'package:baraton_soko/models/like_dislike_model.dart';
import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/use_cases/like_dislike/read_product_dislikes.dart';
import 'package:baraton_soko/use_cases/like_dislike/read_product_likes.dart';
import 'package:baraton_soko/use_cases/products/read_all_products.dart';
import 'package:baraton_soko/use_cases/products/read_single_product.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  void addProduct(ProductModel product) {
    _products.add(product);
    notifyListeners();
  }

  final ReadAllProductsUseCase _readAllProductsUseCase;
  final ReadAllProductsSortByLikesUseCase _readAllProductsSortByLikesUseCase;
  final ReadAllLatestProductsSortByCreatedUseCase _readAllLatestProductsSortByCreatedUseCase;
  final ReadProductLikesUseCase _readProductLikesUseCase;
  final ReadProductDislikesUseCase _readProductDislikesUseCase;
  final ReadSingleProductUseCase _readSingleProductUseCase;

  Future<List<ProductModel>> getAllProducts() async {
    final result = await _readAllProductsUseCase.getAllProducts();
    _products = result;
    notifyListeners();
    return result;
  }

  Future<List<ProductModel>> getAllProductsSortByLikes() async => await _readAllProductsSortByLikesUseCase.getAllProductsSortByLikes();

  Future<List<ProductModel>> getAllLatestProductsSortByCreated() async => await _readAllLatestProductsSortByCreatedUseCase.getAllLatestProductsSortByCreated();

  Future<ProductModel> getSingleProduct(String productId) async => await _readSingleProductUseCase.getSingleProduct(productId: productId);

  Future<List<LikeDislikeTable>> readProductLikes(String productId) async => await _readProductLikesUseCase.readProductLikes(productId: productId);

  Future<List<LikeDislikeTable>> readProductDislikes(String productId) async => await _readProductDislikesUseCase.readProductDislikes(productId: productId);

  void clearProducts() {
    _products = [];
    notifyListeners();
  }

  ProductsProvider({
    required ReadAllProductsUseCase readAllProductsUseCase,
    required ReadAllProductsSortByLikesUseCase readAllProductsSortByLikesUseCase,
    required ReadAllLatestProductsSortByCreatedUseCase readAllLatestProductsSortByCreatedUseCase,
    required ReadProductLikesUseCase readProductLikesUseCase,
    required ReadProductDislikesUseCase readProductDislikesUseCase,
    required ReadSingleProductUseCase readSingleProductUseCase,
  })  : _products = [],
        _readAllProductsUseCase = readAllProductsUseCase,
        _readAllProductsSortByLikesUseCase = readAllProductsSortByLikesUseCase,
        _readAllLatestProductsSortByCreatedUseCase = readAllLatestProductsSortByCreatedUseCase,
        _readProductLikesUseCase = readProductLikesUseCase,
        _readProductDislikesUseCase = readProductDislikesUseCase,
        _readSingleProductUseCase = readSingleProductUseCase;
}
