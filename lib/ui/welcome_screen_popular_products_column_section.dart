// import 'package:baraton_soko/models/category_model.dart';
// import 'package:baraton_soko/models/product_model.dart';
// import 'package:baraton_soko/providers/categories_provider.dart';
// import 'package:baraton_soko/providers/products_provider.dart';
// import 'package:baraton_soko/ui/my_home_page.dart';
// import 'package:baraton_soko/ui/welcome_screen_product_card.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class WelcomeScreenProductsColumnSection extends StatefulWidget {
//   final BoxConstraints constraints;
//   final String title;
//
//   const WelcomeScreenProductsColumnSection({
//     super.key,
//     required this.constraints,
//     required this.title,
//   });
//
//   @override
//   State<WelcomeScreenProductsColumnSection> createState() => _WelcomeScreenProductsColumnSectionState();
// }
//
// class _WelcomeScreenProductsColumnSectionState extends State<WelcomeScreenProductsColumnSection> {
//   String categoryId = "";
//
//   @override
//   Widget build(BuildContext context) {
//     // final categoryId = context.read<CategoriesProvider>().selectedCategory.id;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       // physics: const NeverScrollableScrollPhysics(),
//       // shrinkWrap: true,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 widget.title,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const MyHomePage())),
//               child: Text(
//                 "View all",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             )
//           ],
//         ),
//         FutureBuilder<List<CategoryModel>>(
//             future: context.read<CategoriesProvider>().fetchCategories(),
//             // initialData: context.read<CategoriesProvider>().categories,
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.hasData) {
//                 if (snapshot.data != null) {
//                   List<CategoryModel> categories = snapshot.data;
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: categories.map((category) {
//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             categoryId = category.id;
//                           });
//                           print(categoryId);
//                         },
//                         child: Container(
//                           margin: const EdgeInsets.all(8),
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             // boxShadow: [
//                             //   BoxShadow(
//                             //     color: Colors.grey.withOpacity(0.5),
//                             //     spreadRadius: 1,
//                             //     blurRadius: 7,
//                             //     offset: const Offset(0, 3), // changes position of shadow
//                             //   ),
//                             // ],
//                           ),
//                           child: Text(category.name),
//                         ),
//                       );
//                     }).toList(),
//                   );
//                 } else {
//                   return    return SizedBox(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator());();
//                 }
//               } else {
//                 return    return SizedBox(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator());();
//               }
//             }),
//         Builder(builder: (context) {
//           return categoryId.isNotEmpty
//               ? SizedBox(
//                   height: 180,
//                   // width: 200,
//                   child: FutureBuilder<List<ProductModel>>(
//                       future: context.read<ProductsProvider>().getAllProducts(),
//                       initialData: context.read<ProductsProvider>().products,
//                       builder: (BuildContext context, AsyncSnapshot snapshot) {
//                         if (snapshot.hasData) {
//                           print(snapshot.data.toString());
//                           if (snapshot.data != null) {
//                             List<ProductModel> products = snapshot.data;
//                             return ListView.builder(
//                               physics: const NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               scrollDirection: Axis.horizontal,
//                               itemCount: products.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return WelcomeScreenProductCard(
//                                   product: products[index],
//                                 );
//                               },
//                             );
//                           } else {
//                             return    return SizedBox(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator());();
//                           }
//                         } else {
//                           return    return SizedBox(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator());();
//                         }
//                       }),
//                 )
//               : Container();
//         })
//       ],
//     );
//   }
// }
