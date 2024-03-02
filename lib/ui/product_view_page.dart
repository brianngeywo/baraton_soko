import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/providers/like_dislikes_provider.dart';
import 'package:baraton_soko/providers/products_provider.dart';
import 'package:baraton_soko/ui/product_view_page_vendor_view_row.dart';
import 'package:baraton_soko/ui/product_view_similar_items_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewPage extends StatefulWidget {
  final ProductModel product;

  const ProductViewPage({super.key, required this.product});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
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
      bottomSheet: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 0,
                color: Colors.white,
                // margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () => context
                          .read<LikeDislikesProvider>()
                          .likeProduct(productId: widget.product.id, userId:"upAplozfZgXXapAV3nxM"),
                      icon: const Icon(Icons.thumb_up),
                      label: StreamBuilder<int>(
                          stream: context.read<LikeDislikesProvider>().getProductLikesCount(productId: widget.product.id),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              print(snapshot.data);
                              if (snapshot.data != null) {
                                var likes = snapshot.data;
                                return Text(likes.toString());
                              } else {
                                return SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator());
                              }
                            } else {
                              return SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator());
                            }
                          }),
                    ),
                    const SizedBox(width: 10),
                    TextButton.icon(
                      onPressed: () => context
                          .read<LikeDislikesProvider>()
                          .dislikeProduct(productId: widget.product.id, userId:"upAplozfZgXXapAV3nxM"),
                      icon: const Icon(Icons.thumb_down, color: Colors.black,),
                      label: StreamBuilder<int>(
                          stream: context.read<LikeDislikesProvider>().getProductDisLikesCount(productId: widget.product.id),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              print(snapshot.data);
                              if (snapshot.data != null) {
                                var likes = snapshot.data;
                                return Text(likes.toString());
                              } else {
                                return SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator());
                              }
                            } else {
                              return SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator());
                            }
                          }),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        "Confirm request",
                        style: TextStyle(),
                      ),
                      content: const Text(
                        "Are you sure you want to request this item?",
                        style: TextStyle(),
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                              // backgroundColor: Colors.blue.shade900,
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "Cancel",
                              // style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              // backgroundColor: Colors.blue.shade900,
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                          onPressed: () => context.read<ProductsProvider>().requestProduct(productId: widget.product.id).whenComplete(() =>  Navigator.of(context).pop(),),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "Confirm",
                              // style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child:  Padding(
                  padding: EdgeInsets.all(4.0),
                   child: StreamBuilder<int>(
                stream: context.read<ProductsProvider>().checkProductRequestStatus(productId: widget.product.id),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data >= 1) {
                        return Text(
                          "Requested",
                          style: TextStyle(color: Colors.white),
                        );
                      } else {
                        return Text(
                          "Request",
                          style: TextStyle(color: Colors.white),
                        );
                      }
                    } else {
                      return SizedBox(height: 20, width: 20, child: CircularProgressIndicator());
                      ();
                    }
                  }),
                  ),
                ),
          ]
              ),
        )
          ),


      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(widget.product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                height: constraints.maxHeight * 0.3,
                width: double.infinity,
              ),
              ProductViewPageVendorViewRow(product: widget.product),
              Divider(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "KES ${widget.product.price}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Product description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aute vel minim euismod praesent officia eos sanctus cum commodi "
                      "aliquip esse ea, lobortis exercitation enim luptatum elitr liber, nihil velit ullamco labore aute dolore nostrud iure justo esse quis illum tempor nonummy placerat nonumy. "
                          "Illum aliquyam duis option sanctus. Aliquid zzril nihil clita aliquam accumsan takimata culpa quod iusto clita nostrud. Aliquam nostrud vel. Kasd liber vel.sn",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              Divider(),
              ProductViewSimilarItemsSection(categoryId: widget.product.categoryId),
              const SizedBox(height: 70),
            ],
          ),
        );
      }),
    );
  }
}
