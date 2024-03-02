import 'package:baraton_soko/providers/like_dislikes_provider.dart';
import 'package:baraton_soko/ui/local_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePageProductCardLikeDislikeSection extends StatelessWidget {
  final String productId;

  const MyHomePageProductCardLikeDislikeSection({
    super.key,
    required this.productId,
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
            onPressed: () => context.read<LikeDislikesProvider>().likeProduct(productId: productId, userId: firebaseAuth.currentUser!.uid),
            icon: Icon(
              Icons.thumb_up,
              color: Colors.black,
            ),
            label: StreamBuilder<int>(
                stream: context.read<LikeDislikesProvider>().getProductLikesCount(productId: productId),
                builder: (context, snapshot) {
                  return Text("Upvotes ${snapshot.data.toString()}");
                }),
          ),
          SizedBox(width: 10),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.thumb_down,
              color: Colors.black,
            ),
            label: StreamBuilder<int>(
                stream: context.read<LikeDislikesProvider>().getProductDisLikesCount(productId: productId),
                builder: (context, snapshot) {
                  return Text("${snapshot.data.toString()}");
                }),
          ),
        ],
      ),
    );
  }
}
