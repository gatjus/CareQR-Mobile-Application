import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  final String name;
  final String role;

  const UserHeader({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
      radius: 40, // ✅ Mas malaking bilog
      backgroundColor: Colors.grey, // ✅ Clinic staff theme color
      child: const Icon(Icons.person, size: 50, color: Colors.white), // ✅ White Person Icon sa loob ng Circle
    ),
        Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(role, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}