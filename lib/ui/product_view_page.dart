import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/providers/like_dislikes_provider.dart';
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
                      onPressed: () => context.read<LikeDislikesProvider>().likeDislikePost(productId: widget.product.id, isLike: true),
                      icon: const Icon(Icons.thumb_up),
                      label: const Text("Upvote"),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () => context.read<LikeDislikesProvider>().likeDislikePost(productId: widget.product.id, isLike: false),
                      icon: const Icon(Icons.thumb_down_alt_outlined),
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
                          onPressed: () {},
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
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Request this item",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(widget.product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                height: constraints.maxHeight * 0.3,
                width: double.infinity,
              ),
              ProductViewPageVendorViewRow(product: widget.product),
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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          "KES ${widget.product.price}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Product description",
                      style: TextStyle(),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aute vel minim euismod praesent officia eos sanctus cum commodi "
                      "aliquip esse ea, lobortis exercitation enim luptatum elitr liber, nihil velit ullamco labore aute dolore nostrud iure justo esse quis illum tempor nonummy placerat nonumy. Illum aliquyam duis option sanctus. Aliquid zzril nihil clita aliquam accumsan takimata culpa quod iusto clita nostrud. Aliquam nostrud vel. Kasd liber vel.sn",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
               ProductViewSimilarItemsSection(categoryId: widget.product.categoryId),
              const SizedBox(height: 70),
            ],
          ),
        );
      }),
    );
  }
}
