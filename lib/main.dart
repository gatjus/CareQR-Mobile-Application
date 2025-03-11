import 'package:careqr_new/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:careqr_new/screens/login_screen.dart';
import 'package:careqr_new/screens/qr_search_screen.dart';
import 'package:careqr_new/screens/clinic_staff_screen.dart';
import 'package:careqr_new/screens/landing_screen.dart';
import 'package:careqr_new/screens/student_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Siguraduhin na maayos ang initialization

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CareQR',
      theme: ThemeData(primarySwatch: Colors.green),

      // ✅ Define routes
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/landing': (context) => const LandingScreen(), // ✅ Landing Screen as Home
        '/qr-search': (context) => const QRSearchScreen(),
        '/student': (context) => const StudentScreen(),
        '/clinic-staff': (context) => const ClinicStaffScreen(), // ✅ Register Clinic Staff Screen
      },
    );
  }
}