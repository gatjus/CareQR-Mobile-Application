import 'package:careqr_new/services/auth_service.dart';
import 'package:flutter/material.dart';

class ClinicStaffSignUpScreen extends StatefulWidget {
  const ClinicStaffSignUpScreen({super.key});
  @override
  ClinicStaffSignUpScreenState createState() => ClinicStaffSignUpScreenState();
}

class ClinicStaffSignUpScreenState extends State<ClinicStaffSignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clinic Staff Sign-Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
             onPressed: () async {
                await AuthService().signup(email: _emailController.text, 
                password: _passwordController.text, context: context);

              }, child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}