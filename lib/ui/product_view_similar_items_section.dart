import 'package:baraton_soko/databases/like_dislike_db.dart';
import 'package:baraton_soko/ui/product_view_page.dart';
import 'package:baraton_soko/use_cases/like_dislike/read_product_likes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductViewSimilarItemsSection extends StatelessWidget {
  const ProductViewSimilarItemsSection({
    super.key,
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
          FutureBuilder(
              future: ReadProductLikesUseCase(LikeDisLikeDatabase()).readProductLikes(productId: "productId"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    return           SizedBox(
                      height: 215,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 0,
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.grey.shade200,
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
                                    onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ProductViewPage())),
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
                }
              }),
        ],
      ),
    );
  }
}
