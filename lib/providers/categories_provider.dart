import 'package:baraton_soko/models/category_model.dart';
import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/use_cases/categories/read_all_categories.dart';
import 'package:baraton_soko/use_cases/categories/read_category_products.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  CategoriesProvider({
    required ReadAllcategoriesUseCase allcategoriesUseCase,
    required ReadCategoryProductsUseCase categoryProductsUseCase,
  })  : _categories = [],
        _allcategoriesUseCase = allcategoriesUseCase,
        _categoryProductsUseCase = categoryProductsUseCase;
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;
  final ReadAllcategoriesUseCase _allcategoriesUseCase;
  final ReadCategoryProductsUseCase _categoryProductsUseCase;

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await _allcategoriesUseCase.getAllcategories();
    _categories = response;
    notifyListeners();
    return response;
  }

  Future<List<ProductModel>> fetchCategoryProducts(String categoryId) async => await _categoryProductsUseCase.getAllSingleCategoryProducts(category: categoryId);
}
