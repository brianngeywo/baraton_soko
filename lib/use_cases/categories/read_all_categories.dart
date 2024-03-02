import 'package:baraton_soko/databases/category_db.dart';
import 'package:baraton_soko/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadAllcategoriesUseCase {
  final CategoriesDatabase _database;

  ReadAllcategoriesUseCase(this._database);

   Future<List<CategoryModel>> getAllcategories() async {
    final result =  await _database.getAllcategories();
    var categories = result.docs.map((e) => CategoryModel.fromMap(e.data())).toList();
    return categories;
  }
}