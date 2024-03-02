import 'package:baraton_soko/models/like_dislike_model.dart';
import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/providers/like_dislikes_provider.dart';
import 'package:baraton_soko/ui/product_view_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreenProductCard extends StatelessWidget {
  final ProductModel product;

  const WelcomeScreenProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var likes = context.read<LikeDislikesProvider>().readProductLikes(product.id);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
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
                      product: product,
                    ))),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: constraints.maxHeight * 0.3,
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
                        product.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () => context.read<LikeDislikesProvider>().likeDislikePost(productId: product.id, isLike: true),
                      icon: const Icon(Icons.thumb_up),
                      label: FutureBuilder<List<LikeDislikeTable>>(
                          future: likes,
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
  }
}
