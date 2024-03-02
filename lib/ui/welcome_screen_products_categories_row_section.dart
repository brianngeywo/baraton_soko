import 'package:baraton_soko/models/category_model.dart';
import 'package:baraton_soko/providers/categories_provider.dart';
import 'package:baraton_soko/ui/welcome_screen_selected_category_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreenProductsCategoriesRowSection extends StatelessWidget {
  const WelcomeScreenProductsCategoriesRowSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
        future: context.read<CategoriesProvider>().fetchCategories(),
        // initialData: context.read<CategoriesProvider>().categories,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              List<CategoryModel> categories = snapshot.data;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: categories.map((category) {
                    return GestureDetector(
                      onTap: () {
                       context.read<CategoriesProvider>().selectCategory(category);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text(category.name),
                      ),
                    );
                  }).toList(),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          } else {
            return CircularProgressIndicator();
          }
        }
    );
  }
}
