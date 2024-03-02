import 'package:baraton_soko/ui/custom_submit_material_button.dart';
import 'package:baraton_soko/ui/custom_text_field.dart';
import 'package:baraton_soko/ui/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Already have an account?"),
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const SignInScreen())),
              child: Text("Login"),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(height: constraints.maxHeight * 0.2),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Welcome to Baraton Soko",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Register"),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    const CustomTextField(
                      labelText: "   first name",
                    ),
                    const CustomTextField(
                      labelText: "   last name",
                    ),
                    const CustomTextField(
                      labelText: "   phone number",
                    ),
                    const CustomTextField(
                      labelText: "   uername",
                    ),
                    const CustomTextField(labelText: "   password"),
                    SizedBox(height: 10),
                    CustomSubmitMaterialButton(onpressed: (){}, actionText: 'Sign up',),
                  ],
                ),
              ),
            );
          },
      ));
  }
}
