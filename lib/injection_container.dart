import 'package:baraton_soko/databases/category_db.dart';
import 'package:baraton_soko/databases/like_dislike_db.dart';
import 'package:baraton_soko/databases/product_db.dart';
import 'package:baraton_soko/databases/users_db.dart';
import 'package:baraton_soko/models/like_dislike_model.dart';
import 'package:baraton_soko/providers/categories_provider.dart';
import 'package:baraton_soko/providers/like_dislikes_provider.dart';
import 'package:baraton_soko/providers/products_provider.dart';
import 'package:baraton_soko/providers/users_provider.dart';
import 'package:baraton_soko/use_cases/categories/read_all_categories.dart';
import 'package:baraton_soko/use_cases/categories/read_category_products.dart';
import 'package:baraton_soko/use_cases/like_dislike/dislike_product.dart';
import 'package:baraton_soko/use_cases/like_dislike/like_product.dart';
import 'package:baraton_soko/use_cases/like_dislike/read_product_dislikes.dart';
import 'package:baraton_soko/use_cases/like_dislike/read_product_likes.dart';
import 'package:baraton_soko/use_cases/products/read_all_products.dart';
import 'package:baraton_soko/use_cases/products/read_single_product.dart';
import 'package:baraton_soko/use_cases/users/create_user.dart';
import 'package:baraton_soko/use_cases/users/read_user.dart';
import 'package:get_it/get_it.dart';

import 'models/user_model.dart';

class GetItInjectionContainer {
  static final GetIt _getIt = GetIt.instance;


  static GetIt get getIt => _getIt;

   Future<void> registerDependencies() async {
    _getIt
      ..registerFactory<CategoriesProvider>(() => CategoriesProvider(allcategoriesUseCase: _getIt(), categoryProductsUseCase: _getIt()))
      ..registerLazySingleton<ReadAllcategoriesUseCase>(() => ReadAllcategoriesUseCase(_getIt()))..registerLazySingleton<
        ReadCategoryProductsUseCase>(() => ReadCategoryProductsUseCase(_getIt()))..registerLazySingleton<CategoriesDatabase>(() =>
        CategoriesDatabase());

    _getIt
      ..registerFactory<ProductsProvider>(() =>
          ProductsProvider(
            readAllProductsUseCase: _getIt(),
            readAllProductsSortByLikesUseCase: _getIt(),
            readAllLatestProductsSortByCreatedUseCase: _getIt(),

            readSingleProductUseCase: _getIt(),
          ))
      ..registerLazySingleton<ReadAllProductsUseCase>(() => ReadAllProductsUseCase(_getIt()))..registerLazySingleton<
        ReadAllProductsSortByLikesUseCase>(() => ReadAllProductsSortByLikesUseCase(_getIt()))..registerLazySingleton<
        ReadAllLatestProductsSortByCreatedUseCase>(() => ReadAllLatestProductsSortByCreatedUseCase(_getIt()))..registerLazySingleton<
        ReadProductLikesUseCase>(() => ReadProductLikesUseCase(_getIt()))..registerLazySingleton<ReadProductDislikesUseCase>(() =>
        ReadProductDislikesUseCase(_getIt()))..registerLazySingleton<ReadSingleProductUseCase>(() =>
        ReadSingleProductUseCase(_getIt()))..registerLazySingleton<LikeDisLikeDatabase>(() => LikeDisLikeDatabase())..registerLazySingleton<ProductsDatabase>(() => ProductsDatabase());

    _getIt
    ..registerFactory<UsersProvider>(() => UsersProvider(createUserUseCase: _getIt(), readSingleUserUseCase: _getIt()))
    ..registerLazySingleton<CreateUserUseCase>(() => CreateUserUseCase(_getIt()))
    ..registerLazySingleton<ReadSingleUserUseCase>(() => ReadSingleUserUseCase(_getIt()))
    ..registerLazySingleton<UsersDatabase>(() => UsersDatabase());

    _getIt
    ..registerFactory<LikeDislikesProvider>(() => LikeDislikesProvider(likeProductUseCase: _getIt(), dislikeProductUseCase: _getIt(),
    readProductLikesUseCase: _getIt(),
    readProductDislikesUseCase: _getIt(),))
    ..registerLazySingleton<LikeProductUseCase>(() => LikeProductUseCase(_getIt()))
    ..registerLazySingleton<DislikeProductUseCase>(() => DislikeProductUseCase(_getIt()))
    ..registerLazySingleton<LikeDisLikeDatabase>(() =>
    LikeDisLikeDatabase());
  }
}
