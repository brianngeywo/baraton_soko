import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/ui/my_home_page_product_card_like_dislike_section.dart';
import 'package:baraton_soko/ui/my_home_page_product_card_vendor_infor_header_section.dart';
import 'package:baraton_soko/ui/product_view_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePageProductCard extends StatelessWidget {
  final ProductModel product;
  const MyHomePageProductCard({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          elevation: 5,
          color: Colors.white,
          margin: const EdgeInsets.all(18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyHomePageProductCardVendorInforHeaderSection(),
              MaterialButton(
                onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ProductViewPage(product: product,))),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(product.imageUrl),
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
                    MyHomePageProductCardLikeDislikeSection(productId: product.id,),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
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
  }
}
