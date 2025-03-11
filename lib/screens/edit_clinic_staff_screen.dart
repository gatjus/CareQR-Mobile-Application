import 'package:flutter/material.dart';

class EditClinicStaffScreen extends StatefulWidget {
  final String currentName;
  final String currentEmail;
  final String currentMobile;

  const EditClinicStaffScreen({
    super.key,
    required this.currentName,
    required this.currentEmail,
    required this.currentMobile,
  });

  @override
  EditClinicStaffScreenState createState() => EditClinicStaffScreenState();
}

class EditClinicStaffScreenState extends State<EditClinicStaffScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _mobileController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _emailController = TextEditingController(text: widget.currentEmail);
    _mobileController = TextEditingController(text: widget.currentMobile);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    Navigator.pop(context, {
      'name': _nameController.text,
      'email': _emailController.text,
      'mobile': _mobileController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _mobileController,
              decoration: const InputDecoration(labelText: "Mobile"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}