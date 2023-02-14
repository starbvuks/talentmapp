import 'package:flutter/material.dart';
import 'screens/applicant_dashboard_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/login_screen.dart';
import 'screens/recruiter_dashboard_screen.dart';
import 'screens/profile_creation_screen.dart';
import 'screens/signup_screen.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TalentMapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingScreen(),
      routes: <String, WidgetBuilder>{
        '/landing': (BuildContext context) => LandingScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/signup': (BuildContext context) => SignUpScreen(),
        '/applicant_dashboard': (BuildContext context) => ApplicantDashboard(
                user: User(
              firstName: 'Abhi',
              lastName: "K",
              email: 'e',
              password: 'e',
              userRole: UserRole.applicant,
            )),
        // '/recruiter_dashboard': (BuildContext context) =>
        //     RecruiterDashboard(user: User()),
        // '/profile_creation': (BuildContext context) =>
        //     ProfileCreationScreen(user: User()),
      },
    );
  }
}
