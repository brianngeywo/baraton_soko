import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePageProductCardVendorInforHeaderSection extends StatelessWidget {
  const MyHomePageProductCardVendorInforHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CircleAvatar(
          //     backgroundColor: Colors.grey.shade300,
          //     radius: 20,
          //   ),
          // ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 8),
                child: Text("Pressy stores"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text("Baraton Hostels"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
