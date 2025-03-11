import 'package:flutter/material.dart';

class EditStudentScreen extends StatefulWidget {
  final String studentName;
  final String studentNo;
  final String course;
  final String dob;
  final String address;

  const EditStudentScreen({
    super.key,
    required this.studentName,
    required this.studentNo,
    required this.course,
    required this.dob,
    required this.address,
  });

  @override
  EditStudentScreenState createState() => EditStudentScreenState();
}

class EditStudentScreenState extends State<EditStudentScreen> {
  late TextEditingController _nameController;
  late TextEditingController _studentNoController;
  late TextEditingController _courseController;
  late TextEditingController _dobController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.studentName);
    _studentNoController = TextEditingController(text: widget.studentNo);
    _courseController = TextEditingController(text: widget.course);
    _dobController = TextEditingController(text: widget.dob);
    _addressController = TextEditingController(text: widget.address);
  }

  void _saveChanges() {
    Navigator.pop(context, {
      'studentName': _nameController.text,
      'studentNo': _studentNoController.text,
      'course': _courseController.text,
      'dob': _dobController.text,
      'address': _addressController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Student Profile")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _studentNoController,
              decoration: InputDecoration(labelText: "Student No."),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _courseController,
              decoration: InputDecoration(labelText: "Course & Year"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _dobController,
              decoration: InputDecoration(labelText: "Date of Birth"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: "Address"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}