import 'dart:ffi';
import 'dart:io';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/user.dart';

class ApplicantProfileScreen extends StatefulWidget {
  final User user;

  const ApplicantProfileScreen({Key? key, required this.user})
      : super(key: key);

  @override
  _ApplicantProfileScreenState createState() => _ApplicantProfileScreenState();
}

class _ApplicantProfileScreenState extends State<ApplicantProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  // late TextEditingController _phoneController;
  // late TextEditingController _addressController;
  // late TextEditingController _skillsController;
  // late TextEditingController _experienceController;
  // late TextEditingController _educationController;
  File? _profilePic;

  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();

    _firstNameController = TextEditingController(text: widget.user.firstName);
    _lastNameController = TextEditingController(text: widget.user.lastName);
    _emailController = TextEditingController(text: widget.user.email);
    // _phoneController = TextEditingController(text: widget.user.phone);
    // _addressController = TextEditingController(text: widget.user.address);
    // _skillsController = TextEditingController(text: widget.user.skills);
    // _experienceController = TextEditingController(text: widget.user.experience);
    // _educationController = TextEditingController(text: widget.user.education);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    // _phoneController.dispose();
    // _addressController.dispose();
    // _skillsController.dispose();
    // _experienceController.dispose();
    // _educationController.dispose();

    super.dispose();
  }

  final String profilePicPath =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";

  // File profilePic = File(profilePicPath);

  // Future _getImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedFile != null) {
  //       _profilePic = File(pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final User user;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Applicant Profile',
            style: GoogleFonts.lato(),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditMode = true;
                });
              },
            ),
          ],
        ),
        body: Form(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(height: 16),
                      GestureDetector(
                        // onTap: _isEditMode ? _pickImage : null,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: profilePicPath != null
                              ? NetworkImage(profilePicPath) as ImageProvider
                              : widget.user.profilePicture != null
                                  ? NetworkImage(widget.user.profilePicture!)
                                  : null,
                          child: profilePicPath == null &&
                                  widget.user.profilePicture == null
                              ? Icon(Icons.person,
                                  size: 50, color: Colors.white)
                              : null,
                        ),
                      ),
                      TextFormField(
                        controller: _firstNameController,
                        enabled: _isEditMode,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        enabled: _isEditMode,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _emailController,
                        enabled: _isEditMode,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),

                      // TextFormField(
                      //     controller: _addressController,
                      //     enabled: _isEditMode,
                      //     decoration: InputDecoration(
                      //       labelText: 'Address',
                      //     ))
                      // ),
                      // TextFormField(
                      //   controller: _skillsController,
                      //   enabled: _isEditMode,
                      //   decoration: InputDecoration(
                      //     labelText: 'Skills',
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your skills';
                      //     }
                      //     return null;
                      //   },
                      // )
                    ])) //     labelText: 'Skills
                )));
  }
}
