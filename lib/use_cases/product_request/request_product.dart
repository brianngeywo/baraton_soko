import 'package:baraton_soko/databases/product_db.dart';

class RequestProductUseCase {
  final ProductsDatabase _productsDatabase;

  RequestProductUseCase({required ProductsDatabase productsDatabase}) : _productsDatabase = productsDatabase;

  call({required String productId})=> _productsDatabase.sendProductrequest(productId: productId);
}