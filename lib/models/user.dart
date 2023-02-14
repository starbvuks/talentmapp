enum UserRole {
  recruiter,
  applicant,
}

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final UserRole userRole;
  final String? companyName;
  final String? jobTitle;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.userRole,
    this.companyName,
    this.jobTitle,
  });
}
