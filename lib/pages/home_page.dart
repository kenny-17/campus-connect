import 'package:flutter/material.dart';
import 'find_friends.dart'; // 👈 for the navigation to work
import 'share_location.dart';
import 'friends_nearby.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007A33), // Dark Green Background
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top concert banner image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/concert_banner.png',
                height: 200,
                width: 350,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),

            // Tagline
            const Text(
              'Quickly find your friends at a concert with no internet',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),

            // Button 1: Find Friends
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF059862),
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.search, size: 24),
              label: const Text(
                'Find Friends',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const FindFriendsPage()),
  );
},

            ),
            const SizedBox(height: 15),

            // Button 2: Share Location
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF059862),
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.location_on, size: 24),
              label: const Text(
                'Share Location',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ShareLocationPage()),
  );
},

            ),
            const SizedBox(height: 15),

            // Button 3: Friends Nearby
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF059862),
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.group, size: 24),
              label: const Text(
                'Friends Nearby',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const FriendsNearbyPage()),
  );
},

            ),
          ],
        ),
      ),
    );
  }
}