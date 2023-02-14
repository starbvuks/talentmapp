import 'package:flutter/material.dart';
import 'package:talentmappdraft/models/user.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'applicant_dashboard_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TalentMapp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Log In'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: const Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ApplicantDashboard(
                              user: User(
                            firstName: 'Abhi',
                            lastName: "K",
                            email: 'e',
                            password: 'e',
                            userRole: UserRole.applicant,
                          ))),
                );
              },
              child: const Text('Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
