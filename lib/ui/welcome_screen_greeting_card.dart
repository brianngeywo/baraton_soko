import 'package:baraton_soko/ui/welcome_screen_popular_products_column_section.dart';
import 'package:flutter/material.dart';

class WelcomeScreenGreetingCard extends StatelessWidget {
  final BoxConstraints constraints;
  const WelcomeScreenGreetingCard({
    super.key, required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome to Baraton Soko",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Your voice matters. \nVote for your favorite products to enhance your experience",
                    // overflow: TextOverflow.fade,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
