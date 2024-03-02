import 'package:flutter/material.dart';

class WelcomeScreenGreetingCard extends StatelessWidget {
  final BoxConstraints constraints;

  const WelcomeScreenGreetingCard({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      height: 180,
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome to Baraton Soko",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Your voice matters. \nVote for your favorite products to enhance your experience",
                      // overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              // height: 100,
              width: 130,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/baraton-soko-project.appspot.com/o/pexels-photo-3772506-removebg-preview.png?alt=media&token=02bc2693-b839-486e-8c3f-a16ce1e7b51e"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
