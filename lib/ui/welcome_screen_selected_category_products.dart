import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/providers/categories_provider.dart';
import 'package:baraton_soko/providers/products_provider.dart';
import 'package:baraton_soko/ui/welcome_screen_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreenSelectedCategoryProducts extends StatelessWidget {
  final String categoryId;

  const WelcomeScreenSelectedCategoryProducts({
    super.key,
    required this.constraints,
    required this.categoryId,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
 return   FutureBuilder<List<ProductModel>>(
        future: context.read<CategoriesProvider>().fetchCategoryProducts(categoryId),
        initialData: context.read<ProductsProvider>().products,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              var products = snapshot.data;
            return  ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return WelcomeScreenProductCard(
                    product: products[index],
                    constraints: constraints,
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
