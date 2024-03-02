import 'package:baraton_soko/databases/product_db.dart';

class RequestProductUseCase {
  final ProductsDatabase _productsDatabase;

  RequestProductUseCase({required ProductsDatabase productsDatabase}) : _productsDatabase = productsDatabase;

  Future<String> call({required String productId}) => _productsDatabase.sendProductrequest(productId: productId, userId: 'upAplozfZgXXapAV3nxM');
}

class CheckProductRequestStatusUseCase {
  final ProductsDatabase _productsDatabase;

  CheckProductRequestStatusUseCase({required ProductsDatabase productsDatabase}) : _productsDatabase = productsDatabase;

   Stream<int> call({required String productId}) =>  _productsDatabase.checkProductRequestStatus(productId: productId, userId: 'upAplozfZgXXapAV3nxM');

}
