import 'package:flutter/material.dart';
import '../models/user.dart';

class ApplicantDashboard extends StatelessWidget {
  final User user;

  ApplicantDashboard({required this.user});
  // ApplicantDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicant Dashboard'),
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
              'You are logged in as an applicant.',
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
