import 'package:flutter/material.dart';
import 'package:talentmappdraft/models/user.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'dashboards/applicant_dashboard_screen.dart';
import 'map_test.dart';
import 'applicant_profile_screen.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

import '../amplifyconfiguration.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void fetchAmplify() async {
    try {
      String graphQLDocument = '''query listUsers {
        listUsers {
          items {
            id
            first_name
            last_name
            email
            password
            role
            created_at
            updated_at
          }
        }
      }''';

      var operation = Amplify.API
          .query(request: GraphQLRequest<String>(document: graphQLDocument));

      var response = await operation.response;
      var data = response.data;

      print('Query result: ' + data!);
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }

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
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
              },
              child: const Text('Map Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ApplicantProfileScreen(
                              user: User(
                            profilePicture:
                                "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                            firstName: 'Sarvag',
                            lastName: "Kalari",
                            email: 'sarvag@talentmapp.co',
                            password: '12345678',
                            phone: '9533586416',
                            skills: Skill(name: 'Full Stack', level: 4),
                            userRole: UserRole.applicant,
                          ))),
                );
              },
              child: const Text('Dashboard'),
            ),
            ElevatedButton(
              onPressed: () {
                fetchAmplify();
              },
              child: const Text('AppSync'),
            ),
          ],
        ),
      ),
    );
  }
}
