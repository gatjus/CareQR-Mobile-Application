import 'package:flutter/material.dart';

class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Find a code to scan",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildScannerView(),
          const SizedBox(height: 40),
        ],
      ),
    ),
    );
  }

  Widget _buildScannerView() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 280,
          height: 360,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.5 * 255).toInt()),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
        ),
        Image.network(
          "https://cdn.builder.io/api/v1/image/assets/TEMP/dc96e185a5230b41cc058768d4c2e4ab9c8e22bf",
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 0,
          left: 0,
          child: _scannerFrame(),
        ),
      ],
    );
  }

  Widget _scannerFrame() {
    return Container(
      alignment: Alignment.center,
      width: 280,
      height: 360,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}