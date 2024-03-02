import 'package:baraton_soko/ui/product_view_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreenProductCard extends StatelessWidget {
  final BoxConstraints constraints;
  const WelcomeScreenProductCard({
    super.key, required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: constraints.maxWidth * 0.4,
      // height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const ProductViewPage())),
            child: Container(
              color: Colors.grey.shade200,
              height: constraints.maxHeight * 0.3,
              width: constraints.maxWidth * 0.4,
              margin: EdgeInsets.all(8),
            ),
          ),
          SizedBox(
            width: constraints.maxWidth * 0.4,
            // height: 200,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Nike"),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  label: const Text("100"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
