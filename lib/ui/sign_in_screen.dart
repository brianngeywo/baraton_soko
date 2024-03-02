import 'package:baraton_soko/ui/custom_submit_material_button.dart';
import 'package:baraton_soko/ui/custom_text_field.dart';
import 'package:baraton_soko/ui/signup_screen.dart';
import 'package:baraton_soko/ui/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              Text("Need an account?"),
              TextButton(
                onPressed: () => Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const SignUpScreen())),
                child: Text("Sign up"),
              ),
            ],
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.2),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Welcome to Baraton Soko",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text("Login"),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: '   username',
                    ),
                    CustomTextField(
                      labelText: '   password',
                    ),
                    SizedBox(height: 10),
                    CustomSubmitMaterialButton(
                      onpressed: () => Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const WelcomeScreen())),
                      actionText: 'Login',
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
