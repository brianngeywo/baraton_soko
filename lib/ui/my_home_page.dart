import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/providers/products_provider.dart';
import 'package:baraton_soko/ui/my_home_page_product_card.dart';
import 'package:baraton_soko/ui/my_home_page_product_card_like_dislike_section.dart';
import 'package:baraton_soko/ui/my_home_page_product_card_vendor_infor_header_section.dart';
import 'package:baraton_soko/ui/product_view_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: Center(child: LayoutBuilder(builder: (context, constraints) {
        return ListView(
          children: [
            // Card(
            //   elevation: 5,
            //   color: Colors.white,
            //   margin: const EdgeInsets.all(18),
            //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       IconButton(
            //         onPressed: () {},
            //         icon: const Icon(CupertinoIcons.search),
            //       ),
            //     ],
            //   ),
            // ),
            FutureBuilder<List<ProductModel>>(
                future: context.read<ProductsProvider>().getAllProducts(),
                initialData: context.read<ProductsProvider>().products,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      print(snapshot.data.toString());
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 5,
                            color: Colors.white,
                            margin: const EdgeInsets.all(18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const MyHomePageProductCardVendorInforHeaderSection(),
                                MaterialButton(
                                  onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (context) => ProductViewPage(
                                            product: snapshot.data[index],
                                          ))),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage( snapshot.data[index].imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    height: constraints.maxHeight * 0.3,
                                    width: double.infinity,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyHomePageProductCardLikeDislikeSection(
                                        productId:  snapshot.data[index].id,
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.blue.shade900,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        ),
                                        onPressed: () {},
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text(
                                            "Request",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
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
          ],
        );
      })),
    );
  }
}
