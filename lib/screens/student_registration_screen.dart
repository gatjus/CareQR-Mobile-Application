import 'package:flutter/material.dart';

class StudentRegistrationScreen extends StatelessWidget {
  StudentRegistrationScreen({super.key});  

  final _formKey = GlobalKey<FormState>(); // ✅ Dapat nasa taas ng build()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
        centerTitle: true,
      ),
      body: Form( // ✅ Form dapat nasa loob ng body
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            _buildSectionTitle("Student Information"),
            _buildTextField("Name", "Enter your name"),
            _buildTextField("Date of Birth", "DD/MM/YYYY"),
            _buildTextField("Gender", "Enter your gender"),
            _buildTextField("Grade Level", "Enter your grade level"),
            _buildTextField("Student No", "Enter your student no."),
            
            _buildSectionTitle("Parent/Guardian Information"),
            _buildTextField("Name", "Enter your name"),
            _buildTextField("Relationship to Student", "Enter"),
            _buildTextField("Contact Number", "Enter your contact number"),
            _buildTextField("Home Address", "Enter your address"),
            _buildTextField("Emergency Contact", "Enter your emergency contact"),
            
            _buildSectionTitle("Medical Information"),
            _buildTextField("Allergies", "Enter"),
            _buildTextField("Chronic Conditions", "Enter"),
            
            const SizedBox(height: 20),
            _buildButtonGroup(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField( // ✅ Gamitin ang `TextFormField` para sa validation
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
        validator: (value) { // ✅ Validation logic
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildButtonGroup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) { // ✅ Validate bago mag-submit
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Form Submitted")),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          child: const Text("Save", style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          child: const Text("Cancel", style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ],
    );
  }
}