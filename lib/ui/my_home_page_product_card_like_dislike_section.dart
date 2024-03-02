import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/providers/like_dislikes_provider.dart';
import 'package:baraton_soko/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePageProductCardLikeDislikeSection extends StatelessWidget {
  final String productId;
  const MyHomePageProductCardLikeDislikeSection({
    super.key, required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      // margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () => context.read<LikeDislikesProvider>().likeDislikePost(productId: productId, isLike: true),
            icon: Icon(Icons.thumb_up),
            label: Text("Upvote"),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () => context.read<LikeDislikesProvider>().likeDislikePost(productId: productId, isLike: false),
            icon: Icon(Icons.thumb_down_alt_outlined),
          ),
        ],
      ),
    );
  }
}
