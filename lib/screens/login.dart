import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'map_test.dart';

import '../components/my_textbox.dart';
import '../components/my_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  void userSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapScreen()),
    );
  }

  void userSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(children: [
              const SizedBox(height: 90),
              // Icon(Icons.lock, size: 100),
              Image.asset('images/blue-logo-08.png', width: 250),
              const SizedBox(height: 30),
              Text('Hey there! go ahead, login below',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16)),
              const SizedBox(height: 100),
              MyTextField(hintText: 'Email', obscureText: false),
              const SizedBox(height: 30),
              MyTextField(hintText: 'Password', obscureText: true),
              const SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Forgot Password?',
                        style:
                            TextStyle(color: Colors.grey[700], fontSize: 16)),
                    MyButton(
                      onTap: () => userSignIn(context),
                      btnText: 'Sign in',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Don\'t have an account yet?',
                        style:
                            TextStyle(color: Colors.grey[700], fontSize: 16)),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyButton(
                        onTap: () => userSignUp(context),
                        btnText: 'Sign Up',
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
