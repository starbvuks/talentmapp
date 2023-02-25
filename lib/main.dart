import 'package:flutter/material.dart';
import 'screens/dashboards/applicant_dashboard_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboards/recruiter_dashboard_screen.dart';
import 'screens/profile_creation_screen.dart';
import 'screens/map_test.dart';
import 'screens/signup_screen.dart';
import 'models/user.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

import 'amplifyconfiguration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    // Add the following line to add API plugin to your app
    Amplify.addPlugin(AmplifyAPI());

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TalentMapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingScreen(),
      routes: <String, WidgetBuilder>{
        '/landing': (BuildContext context) => LandingScreen(),
        '/map': (BuildContext context) => MapScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/signup': (BuildContext context) => SignUpScreen(),
        '/applicant_dashboard': (BuildContext context) => ApplicantDashboard(
                user: User(
              firstName: 'Sarvag',
              lastName: "Kalari",
              email: 'sarvag@talentmapp.co',
              password: '12345678',
              phone: '9533586416',
              skills: Skill(name: 'Full Stack', level: 4),
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
