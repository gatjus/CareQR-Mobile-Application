import 'package:flutter/material.dart';
import 'student_profile_screen.dart'; // Import StudentProfileScreen
import 'package:careqr_new/screens/student_registration_screen.dart'; // Import Student Registration Screen

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      title: Text("Student List"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildStudentCard(context, "James Reid"),
          _buildStudentCard(context, "Sarah Cruz"),
          _buildStudentCard(context, "Mark Dela Cruz"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentRegistrationScreen(), // Open Registration Screen
            ),
          );
        },
        backgroundColor: Colors.green, // Customize color
        tooltip: "Add Student", // Tooltip for accessibility
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildStudentCard(BuildContext context, String studentName) {
    return Card(
      child: ListTile(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentProfileScreen(
                  studentName: "Juan Dela Cruz",
                  studentNo: "20215512",
                  course: "BSCS 4",
                  dob: "03/01/1999",
                  address: "Bantog, San Miguel, Bulacan",
                ),
              ),
            );
          },
          child: Text(
            studentName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        subtitle: Text("Click to view profile"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}