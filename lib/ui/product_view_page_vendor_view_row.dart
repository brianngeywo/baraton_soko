import 'package:baraton_soko/models/product_model.dart';
import 'package:baraton_soko/models/user_model.dart';
import 'package:baraton_soko/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewPageVendorViewRow extends StatelessWidget {
  final ProductModel product;

  ProductViewPageVendorViewRow({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
        future: context.read<UsersProvider>().readSingleUser(product.vendorId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              var user = snapshot.data;
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      radius: 20,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${user.firstName} ${user.lastName}"),
                      Text("${user.phoneNumber}"),
                    ],
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
