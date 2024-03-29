import 'package:baraton_soko/databases/category_db.dart';
import 'package:baraton_soko/databases/like_dislike_db.dart';
import 'package:baraton_soko/databases/product_db.dart';
import 'package:baraton_soko/databases/users_db.dart';
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
import 'package:baraton_soko/use_cases/like_dislike/stream_product_likes_count.dart';
import 'package:baraton_soko/use_cases/product_request/request_product.dart';
import 'package:baraton_soko/use_cases/products/read_all_products.dart';
import 'package:baraton_soko/use_cases/products/read_single_product.dart';
import 'package:baraton_soko/use_cases/users/create_user.dart';
import 'package:baraton_soko/use_cases/users/read_user.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class GetItInjectionContainer {
  Future<void> registerDependencies() async {
    getIt
      ..registerFactory<CategoriesProvider>(() => CategoriesProvider(
            allcategoriesUseCase: getIt(),
            categoryProductsUseCase: getIt(),
          ))
      ..registerLazySingleton<ReadAllcategoriesUseCase>(() => ReadAllcategoriesUseCase(getIt()))
      ..registerLazySingleton<ReadCategoryProductsUseCase>(() => ReadCategoryProductsUseCase(getIt()))
      ..registerLazySingleton<CategoriesDatabase>(() => CategoriesDatabase());

    getIt
      ..registerFactory<ProductsProvider>(() => ProductsProvider(
            readAllProductsUseCase: getIt(),
            readAllProductsSortByLikesUseCase: getIt(),
            readAllLatestProductsSortByCreatedUseCase: getIt(),
            readSingleProductUseCase: getIt(), requestProductUseCase: getIt(), checkProductRequestStatusUseCase: getIt(),
          ))
      ..registerLazySingleton<ReadAllProductsUseCase>(() => ReadAllProductsUseCase(getIt()))
      ..registerLazySingleton<ReadAllProductsSortByLikesUseCase>(() => ReadAllProductsSortByLikesUseCase(getIt()))
      ..registerLazySingleton<CheckProductRequestStatusUseCase>(() => CheckProductRequestStatusUseCase(productsDatabase: getIt()))
      ..registerLazySingleton<RequestProductUseCase>(() => RequestProductUseCase(productsDatabase: getIt()))
      ..registerLazySingleton<ReadAllLatestProductsSortByCreatedUseCase>(() => ReadAllLatestProductsSortByCreatedUseCase(getIt()))
      ..registerLazySingleton<ReadProductLikesUseCase>(() => ReadProductLikesUseCase(getIt()))
      ..registerLazySingleton<ReadProductDislikesUseCase>(() => ReadProductDislikesUseCase(getIt()))
      ..registerLazySingleton<ReadSingleProductUseCase>(() => ReadSingleProductUseCase(getIt()))
      ..registerLazySingleton<LikeDisLikeDatabase>(() => LikeDisLikeDatabase())
      ..registerLazySingleton<ProductsDatabase>(() => ProductsDatabase());

    getIt
      ..registerFactory<UsersProvider>(() => UsersProvider(createUserUseCase: getIt(), readSingleUserUseCase: getIt()))
      ..registerLazySingleton<CreateUserUseCase>(() => CreateUserUseCase(getIt()))
      ..registerLazySingleton<ReadSingleUserUseCase>(() => ReadSingleUserUseCase(getIt()))
      ..registerLazySingleton<UsersDatabase>(() => UsersDatabase());

    getIt
      ..registerFactory<LikeDislikesProvider>(() => LikeDislikesProvider(
            likeProductUseCase: getIt(),
            dislikeProductUseCase: getIt(),
            readProductLikesUseCase: getIt(),
            readProductDislikesUseCase: getIt(), getProductLikesCountUseCase: getIt(), getProductDisLikesCountUseCase: getIt(),
          ))
      ..registerLazySingleton<LikeProductUseCase>(() => LikeProductUseCase(getIt()))
      ..registerLazySingleton<GetProductLikesCountUseCase>(() => GetProductLikesCountUseCase())
      ..registerLazySingleton<GetProductDisLikesCountUseCase>(() => GetProductDisLikesCountUseCase())
      ..registerLazySingleton<DislikeProductUseCase>(() => DislikeProductUseCase(getIt()));
    // ..registerLazySingleton<LikeDisLikeDatabase>(() =>
    // LikeDisLikeDatabase());
  }
}
