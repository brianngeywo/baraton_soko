import 'package:baraton_soko/models/category_model.dart';
import 'package:baraton_soko/models/like_dislike_model.dart';
import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/providers/categories_provider.dart';
import 'package:baraton_soko/providers/like_dislikes_provider.dart';
import 'package:baraton_soko/providers/products_provider.dart';
import 'package:baraton_soko/ui/my_home_page.dart';
import 'package:baraton_soko/ui/product_view_page.dart';
import 'package:baraton_soko/ui/welcome_screen_greeting_card.dart';
import 'package:baraton_soko/ui/welcome_screen_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: const Text(
          "Baraton Soko",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: ListView(
                children: [
                  WelcomeScreenGreetingCard(constraints: constraints),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Latest products",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const MyHomePage())),
                            child: const Text(
                              "View all",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      // FutureBuilder<List<CategoryModel>>(
                      //     future: context.read<CategoriesProvider>().fetchCategories(),
                      //     // initialData: context.read<CategoriesProvider>().categories,
                      //     builder: (BuildContext context, AsyncSnapshot snapshot) {
                      //       if (snapshot.hasData) {
                      //         if (snapshot.data != null) {
                      //           List<CategoryModel> categories = snapshot.data;
                      //           return Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             children: categories.map((category) {
                      //               return GestureDetector(
                      //                 onTap: () {
                      //                   // setState(() {
                      //                   //   categoryId = category.id;
                      //                   // });
                      //                   // print(categoryId);
                      //                 },
                      //                 child: Container(
                      //                   margin: const EdgeInsets.all(8),
                      //                   padding: const EdgeInsets.all(8),
                      //                   decoration: BoxDecoration(
                      //                     color: Colors.white,
                      //                     borderRadius: BorderRadius.circular(10),
                      //                     // boxShadow: [
                      //                     //   BoxShadow(
                      //                     //     color: Colors.grey.withOpacity(0.5),
                      //                     //     spreadRadius: 1,
                      //                     //     blurRadius: 7,
                      //                     //     offset: const Offset(0, 3), // changes position of shadow
                      //                     //   ),
                      //                     // ],
                      //                   ),
                      //                   child: Text(category.name),
                      //                 ),
                      //               );
                      //             }).toList(),
                      //           );
                      //         } else {
                      //           return const CircularProgressIndicator();
                      //         }
                      //       } else {
                      //         return const CircularProgressIndicator();
                      //       }
                      //     }),
                      SizedBox(
                        height: 220,
                        // width: 200,
                        child: FutureBuilder<List<ProductModel>>(
                            future: context.read<ProductsProvider>().getAllProducts(),
                            initialData: context.read<ProductsProvider>().products,
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                print(snapshot.data.toString());
                                if (snapshot.data != null) {
                                  List<ProductModel> products = snapshot.data;
                                  return ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: products.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return SizedBox(
                                        width: constraints.maxWidth * 0.4,
                                        // height: 200,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            MaterialButton(
                                              padding: EdgeInsets.all(0),
                                              onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
                                                  builder: (context) => ProductViewPage(
                                                    product: products[index],
                                                  ))),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: NetworkImage(products[index].imageUrl),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                height: 150,
                                                width: constraints.maxWidth * 0.4,
                                                margin: EdgeInsets.all(8),
                                              ),
                                            ),
                                            SizedBox(
                                              width: constraints.maxWidth * 0.4,
                                              // height: 200,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      products[index].title,
                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  TextButton.icon(
                                                    onPressed: () => context.read<LikeDislikesProvider>().likeDislikePost(productId: products[index].id, isLike: true),
                                                    icon: const Icon(Icons.thumb_up),
                                                    label: FutureBuilder<List<LikeDislikeTable>>(
                                                        future: context.read<LikeDislikesProvider>().readProductLikes(products[index].id),
                                                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                                                          if (snapshot.hasData) {
                                                            if (snapshot.data != null) {
                                                              var likes = snapshot.data.length;
                                                              return Text(likes.toString());
                                                            } else {
                                                              return CircularProgressIndicator();
                                                            }
                                                          } else {
                                                            return CircularProgressIndicator();
                                                          }
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }),
                      ),
                    ],
                  ),
                  //   Divider(),
                  //   WelcomeScreenProductsColumnSection(
                  //     constraints: constraints,
                  //     title: 'Popular products',
                  //   ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
