import 'package:flutter/material.dart';

class CustomSubmitMaterialButton extends StatelessWidget {
  final Function onpressed;
  final String actionText;
  const CustomSubmitMaterialButton({
    super.key, required this.onpressed, required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.blue.shade900,
        onPressed: () => onpressed(),
        child: Text(actionText, style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
