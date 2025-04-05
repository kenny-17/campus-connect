import 'package:flutter/material.dart';

class FriendsNearbyPage extends StatelessWidget {
  const FriendsNearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Friends Nearby'),
        backgroundColor: const Color(0xFF059862),
      ),
      body: const Center(
        child: Text(
          'This is the Friends Nearby page.',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}