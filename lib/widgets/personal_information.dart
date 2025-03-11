import 'package:flutter/material.dart';

class UserInfo {
  final String gender;
  final String name;
  final String dateOfBirth;
  final String email;
  final String mobile;
  final String address;

  const UserInfo({
    required this.gender,
    required this.name,
    required this.dateOfBirth,
    required this.email,
    required this.mobile,
    required this.address,
  });
}

class PersonalInformation extends StatelessWidget {
  final UserInfo userInfo;

  const PersonalInformation({super.key, required this.userInfo}); // ✅ Fixed!

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Personal Information", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Name: ${userInfo.name}"),
        Text("Gender: ${userInfo.gender}"),
        Text("Date of Birth: ${userInfo.dateOfBirth}"),
        Text("Email: ${userInfo.email}"),
        Text("Mobile: ${userInfo.mobile}"),
        Text("Address: ${userInfo.address}"),
      ],
    );
  }
}