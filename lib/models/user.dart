import 'dart:ffi';

enum UserRole {
  recruiter,
  applicant,
}

class Skill {
  final String name;
  final int level;

  Skill({required this.name, required this.level});
}

class User {
  final String? profilePicture;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String? address;
  final Skill? skills;
  // final Array experience;
  // final Array education;
  final UserRole userRole;
  final String? companyName;
  final String? jobTitle;

  User({
    this.profilePicture,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    this.address,
    this.skills,
    // required this.experience,
    // required this.education,
    required this.userRole,
    this.companyName,
    this.jobTitle,
  });
}
