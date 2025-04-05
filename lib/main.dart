// import 'package:flutter/material.dart';
// import 'dart:async';

// void main() {
//   runApp(const ConcertConnectApp());
// }

// class ConcertConnectApp extends StatelessWidget {
//   const ConcertConnectApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Concert Connect',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: const SplashScreen(),
//     );
//   }
// }

// // Splash Screen
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFD6E85F),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/images/logo.png', height: 150),
//             const SizedBox(height: 30),
//             const CircularProgressIndicator(color: Colors.purpleAccent),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ConcertConnectApp extends StatelessWidget {
//   const ConcertConnectApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Concert Connect',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: const SplashScreen(),
//     );
//   }
// }

// Home Page
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF007A33), // Dark Green Background
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Top concert banner image
//             ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Image.asset(
//                 'assets/images/concert_banner.png',
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 30),

//             // Tagline
//             const Text(
//               'Quickly find your friends at a concert with no internet',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 30),

//             // Button 1: Find Friends
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF059862),
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//                 minimumSize: const Size(double.infinity, 60),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               icon: const Icon(Icons.search, size: 24),
//               label: const Text(
//                 'Find Friends',
//                 style: TextStyle(fontSize: 18),
//               ),
//               onPressed: () {
//                 // Add action here
//               },
//             ),
//             const SizedBox(height: 15),

//             // Button 2: Share Location
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF059862),
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//                 minimumSize: const Size(double.infinity, 60),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               icon: const Icon(Icons.location_on, size: 24),
//               label: const Text(
//                 'Share Location',
//                 style: TextStyle(fontSize: 18),
//               ),
//               onPressed: () {
//                 // Add action here
//               },
//             ),
//             const SizedBox(height: 15),

//             // Button 3: Friends Nearby
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF059862),
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//                 minimumSize: const Size(double.infinity, 60),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               icon: const Icon(Icons.group, size: 24),
//               label: const Text(
//                 'Friends Nearby',
//                 style: TextStyle(fontSize: 18),
//               ),
//               onPressed: () {
//                 // Add action here
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'dart:async';
import 'pages/home_page.dart';
void main() {
  runApp(const ConcertConnectApp());
}

class ConcertConnectApp extends StatelessWidget {
  const ConcertConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concert Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 150),
            const SizedBox(height: 30),
            const CircularProgressIndicator(color: Colors.purpleAccent),
          ],
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: const Center(
//         child: Text(
//           'Welcome to Concert Connect!',
//           style: TextStyle(fontSize: 22, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
