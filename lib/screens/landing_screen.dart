import 'package:careqr_new/screens/qr_search_screen.dart';
import 'package:flutter/material.dart';
import 'student_screen.dart';
import 'package:careqr_new/screens/clinic_staff_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("CareQR"),
        actions: [
          Padding (
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ClinicStaffScreen()),
                );
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 50, color: Colors.black54),
              ),
            ),
          )
        ],
      ),

      body: Column(
        children: [
          SizedBox(height: 20),
          NavigationTabs(
            selectedTab: selectedTab,
            onTabSelected: (index) {
              setState(() {
                selectedTab = index;
              });
            },
          ),
          Expanded(
            child: Center(
              child: selectedTab == 0
                  ? Text("Your history appears here", style: TextStyle(fontSize: 18))
                  : selectedTab == 1
                      ? StudentScreen()
                      : QRSearchScreen(), // ✅ QR Search kapag tab 2
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationTabs extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabSelected;

  const NavigationTabs({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => onTabSelected(0),
          child: Text(
            "HISTORY",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: selectedTab == 0 ? Colors.green : Colors.black,
            ),
          ),
        ),
        SizedBox(width: 20),
        TextButton(
          onPressed: () => onTabSelected(1),
          child: Text(
            "STUDENT",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: selectedTab == 1 ? Colors.green : Colors.black,
            ),
          ),
        ),
        SizedBox(width: 20),
        TextButton(
          onPressed: () => onTabSelected(2),
          child: Text(
            "QR Search",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: selectedTab == 2 ? Colors.green : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}