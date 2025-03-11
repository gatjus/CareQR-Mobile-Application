import 'package:careqr_new/screens/qr_scanner_screen.dart';
import 'package:flutter/material.dart';

class QRSearchScreen extends StatelessWidget {
  const QRSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),

          // Navigation Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
            ],
          ),

          const SizedBox(height: 35),

          // Search Bar and Scan Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search for a student...",
                    border: OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "OR",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => QRScannerScreen()),
                    );
                    
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text("Scan QR Code"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Bottom Navigation Indicator
          
        ],
      ),
    );
  }
}