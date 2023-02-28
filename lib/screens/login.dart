import 'package:flutter/material.dart';
import '../components/my_textbox.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(children: [
              const SizedBox(height: 60),
              Icon(Icons.lock, size: 100),
              const SizedBox(height: 60),
              Text('Hey there! go ahead, login below',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16)),
              const SizedBox(height: 60),
              MyTextField(hintText: 'Email', obscureText: false),
              const SizedBox(height: 30),
              MyTextField(hintText: 'Password', obscureText: true),
            ]),
          ),
        ));
  }
}
