import 'package:flutter/material.dart';
import 'dart:math';

class ShareLocationPage extends StatefulWidget {
  const ShareLocationPage({super.key});

  @override
  State<ShareLocationPage> createState() => _ShareLocationPageState();
}

class _ShareLocationPageState extends State<ShareLocationPage> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  final List<Friend> _friends = [
    Friend(name: 'Ken', icon: Icons.person, color: Colors.blue, x: 0.4, y: 0.3),
    Friend(name: 'Chitranshu', icon: Icons.person, color: Colors.green, x: 0.6, y: 0.5),
    Friend(name: 'Navya', icon: Icons.person, color: Colors.purple, x: 0.35, y: 0.7),
    Friend(name: 'Shubham', icon: Icons.person, color: Colors.orange, x: 0.75, y: 0.4),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Location'),
        backgroundColor: const Color(0xFF059862),
      ),
      body: Stack(
        children: [
          // NSUT Map Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/nsut_map.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Friend Markers
          for (var friend in _friends)
            Positioned(
              left: MediaQuery.of(context).size.width * friend.x,
              top: MediaQuery.of(context).size.height * friend.y,
              child: FriendMarker(
                friend: friend,
                animation: CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOutSine,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class Friend {
  final String name;
  final IconData icon;
  final Color color;
  final double x;
  final double y;

  Friend({
    required this.name,
    required this.icon,
    required this.color,
    required this.x,
    required this.y,
  });
}

class FriendMarker extends StatelessWidget {
  final Friend friend;
  final Animation<double> animation;

  const FriendMarker({
    super.key,
    required this.friend,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            friend.icon,
            color: friend.color,
            size: 32,
          ),
          Text(
            friend.name,
            style: TextStyle(
              color: friend.color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              shadows: const [
                Shadow(
                  blurRadius: 2,
                  color: Colors.black,
                  offset: Offset(1, 1),
                )
              ],
            ),
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: friend.color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: friend.color.withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}