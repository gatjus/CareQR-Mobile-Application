import 'package:flutter/material.dart';
import 'edit_student_screen.dart';

class StudentProfileScreen extends StatefulWidget {
  final String studentName;
  final String studentNo;
  final String course;
  final String dob;
  final String address;

  const StudentProfileScreen({
    super.key,
    required this.studentName,
    required this.studentNo,
    required this.course,
    required this.dob,
    required this.address,
  });

  @override
  StudentProfileScreenState createState() => StudentProfileScreenState();
}

class StudentProfileScreenState extends State<StudentProfileScreen> {
  late String studentName;
  late String studentNo;
  late String course;
  late String dob;
  late String address;

  @override
  void initState() {
    super.initState();
    studentName = widget.studentName;
    studentNo = widget.studentNo;
    course = widget.course;
    dob = widget.dob;
    address = widget.address;
  }

  void _navigateToEditScreen() async {
    final updatedInfo = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditStudentScreen(
          studentName: studentName,
          studentNo: studentNo,
          course: course,
          dob: dob,
          address: address,
        ),
      ),
    );

    if (updatedInfo != null) {
      setState(() {
        studentName = updatedInfo['studentName'];
        studentNo = updatedInfo['studentNo'];
        course = updatedInfo['course'];
        dob = updatedInfo['dob'];
        address = updatedInfo['address'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(studentName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 50, color: Colors.black54),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(studentName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text("COLLEGE", style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {}, // QR Code action here
                          child: Text("QR Code", style: TextStyle(color: Colors.green)),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: _navigateToEditScreen,
                          child: Text("EDIT", style: TextStyle(color: Colors.green)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildStudentDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Student No.: $studentNo", style: TextStyle(fontSize: 16)),
        Text("Course & Year: $course", style: TextStyle(fontSize: 16)),
        Text("Date of Birth: $dob", style: TextStyle(fontSize: 16)),
        Text("Address: $address", style: TextStyle(fontSize: 16)),
      ],
    );
  }
}