import 'package:flutter/material.dart';
import '../models/user.dart';
import 'profile_creation_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  UserRole _selectedUserRole = UserRole.applicant;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onSignUpButtonPressed() {
    final User user = User(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      userRole: _selectedUserRole,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileCreationScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select User Role',
                border: OutlineInputBorder(),
              ),
              items: ['Recruiter', 'Applicant']
                  .map(
                    (role) => DropdownMenuItem(
                      value: role,
                      child: Text(role),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedUserRole = value as UserRole;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _onSignUpButtonPressed,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
