import 'package:flutter/material.dart';
import '../models/user.dart';

class RecruiterDashboard extends StatelessWidget {
  final User user;

  RecruiterDashboard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recruiter Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${user.firstName}!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'You are logged in as a recruiter.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement logout functionality here
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.