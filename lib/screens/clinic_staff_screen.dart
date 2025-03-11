import 'dart:developer' as dev; // ✅ Import logging package
import 'package:flutter/material.dart';
import 'package:careqr_new/widgets/personal_information.dart' as info;
import 'package:careqr_new/widgets/user_header.dart';
import 'package:careqr_new/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:careqr_new/screens/edit_clinic_staff_screen.dart';

class ClinicStaffScreen extends StatefulWidget {
  const ClinicStaffScreen({super.key});

  @override
  ClinicStaffScreenState createState() => ClinicStaffScreenState();
}

class ClinicStaffScreenState extends State<ClinicStaffScreen> {
  // ✅ Placeholder data (Pwedeng i-replace gamit ang Firebase)
  String name = "John Doe";
  String email = "johndoe@example.com";
  String mobile = "+639123456789";

  // ✅ Function para i-update ang data pagkatapos mag-edit
  void _updateProfile(String newName, String newEmail, String newMobile) {
    setState(() {
      name = newName;
      email = newEmail;
      mobile = newMobile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clinic Staff Account"),
        actions: [
          TextButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
              } catch (e) {
                dev.log("Error during logout: $e", name: "LogoutError");
              }
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
      body: Center( // ✅ I-center ang laman
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const UserHeader(name: "John Doe", role: "Clinic Staff"),
              info.PersonalInformation(
                userInfo: info.UserInfo(
                  gender: "Male",
                  name: name,
                  dateOfBirth: "Jan 1, 1985",
                  email: email,
                  mobile: mobile,
                  address: "123 Main St, City, Country",
                ),
              ),
              const SizedBox(height: 20),

              // ✅ EDIT BUTTON
              ElevatedButton(
                onPressed: () async {
                  final updatedData = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditClinicStaffScreen(
                        currentName: name,
                        currentEmail: email,
                        currentMobile: mobile,
                      ),
                    ),
                  );

                  // ✅ Kapag may updated data, i-update ang profile
                  if (updatedData != null) {
                    _updateProfile(
                      updatedData['name'],
                      updatedData['email'],
                      updatedData['mobile'],
                    );
                  }
                },
                child: const Text("Edit Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}