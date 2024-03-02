import 'package:baraton_soko/providers/categories_provider.dart';
import 'package:baraton_soko/ui/my_home_page.dart';
import 'package:baraton_soko/ui/welcome_screen_products_categories_row_section.dart';
import 'package:baraton_soko/ui/welcome_screen_selected_category_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final categoryId = context.read<CategoriesProvider>().selectedCategory.id;
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
            TextButton(
              onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const MyHomePage())),
              child: Text(
                "View all",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        WelcomeScreenProductsCategoriesRowSection(),
        WelcomeScreenSelectedCategoryProducts(constraints: constraints, categoryId: categoryId )
      ],
    );
  }
}
