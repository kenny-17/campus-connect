import 'package:flutter/material.dart';

class ShareLocationPage extends StatelessWidget {
  const ShareLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Share Location'),
        backgroundColor: const Color(0xFF059862),
      ),
      body: const Center(
        child: Text(
          'This is the Share Location page.',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}