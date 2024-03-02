import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/providers/products_provider.dart';
import 'package:baraton_soko/ui/my_home_page_product_card.dart';
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
                      return  ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MyHomePageProductCard(product: snapshot.data[index],);
                        },
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                }),

          ],
        );
      })),
    );
  }
}
