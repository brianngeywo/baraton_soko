import 'package:baraton_soko/ui/my_home_page.dart';
import 'package:baraton_soko/ui/welcome_screen_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreenProductsColumnSection extends StatelessWidget {
  final BoxConstraints constraints;
  final String title;

  const WelcomeScreenProductsColumnSection({
    super.key,
    required this.constraints,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const MyHomePage())), child: Text(
              "View all",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),)
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Food"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Jackets"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Shoes"),
              ),
            ],
          ),
        ),
        SizedBox(
          width: constraints.maxWidth,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WelcomeScreenProductCard(constraints: constraints),
                WelcomeScreenProductCard(constraints: constraints),
                WelcomeScreenProductCard(constraints: constraints),
              ],
            ),
          ),
        )
      ],
    );
  }
}
