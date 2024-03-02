import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/providers/categories_provider.dart';
import 'package:baraton_soko/providers/products_provider.dart';
import 'package:baraton_soko/ui/product_view_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewSimilarItemsSection extends StatelessWidget {
  final String categoryId;

  const ProductViewSimilarItemsSection({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Similar Items",
            style: TextStyle(),
          ),
          const SizedBox(height: 10),
          FutureBuilder<List<ProductModel>>(
              future: context.read<CategoriesProvider>().fetchCategoryProducts(categoryId),
              initialData: context.read<ProductsProvider>().products,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    var products = snapshot.data;
                    return SizedBox(
                      height: 215,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 0,
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(products[index].imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 140,
                                  width: 150,
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  width: 150,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        // backgroundColor: Colors.blue.shade900,
                                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        ),
                                    onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => ProductViewPage(
                                              product: products[index],
                                            ))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text(
                                        "View this item",
                                        // style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ],
      ),
    );
  }
}
