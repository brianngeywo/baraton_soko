import 'package:baraton_soko/ui/welcome_screen_greeting_card.dart';
import 'package:baraton_soko/ui/welcome_screen_popular_products_column_section.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
      body: Container(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  WelcomeScreenGreetingCard(constraints: constraints),
                  Divider(),
                  WelcomeScreenProductsColumnSection(
                    constraints: constraints,
                    title: 'Latest products',
                  ),
                  Divider(),
                  WelcomeScreenProductsColumnSection(
                    constraints: constraints,
                    title: 'Popular products',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
