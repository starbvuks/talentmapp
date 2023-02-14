import 'package:flutter/material.dart';
import '../models/user.dart';
import './applicant_dashboard_screen.dart';
import 'recruiter_dashboard_screen.dart';

class ProfileCreationScreen extends StatefulWidget {
  final User user;

  const ProfileCreationScreen({required this.user});

  @override
  _ProfileCreationScreenState createState() => _ProfileCreationScreenState();
}

class _ProfileCreationScreenState extends State<ProfileCreationScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _companyName;
  String? _jobTitle;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final updatedUser = User(
        firstName: widget.user.firstName,
        lastName: widget.user.lastName,
        email: widget.user.email,
        password: widget.user.password,
        userRole: widget.user.userRole,
        companyName: _companyName,
        jobTitle: _jobTitle,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => updatedUser.userRole == UserRole.applicant
              ? ApplicantDashboard(user: updatedUser)
              : RecruiterDashboard(user: updatedUser),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                initialValue: widget.user.firstName,
                readOnly: true,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                initialValue: widget.user.lastName,
                readOnly: true,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                initialValue: widget.user.email,
                readOnly: true,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Company Name'),
                onSaved: (value) => _companyName = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Job Title'),
                onSaved: (value) => _jobTitle = value,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Create Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
