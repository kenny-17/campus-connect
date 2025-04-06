import 'package:flutter/material.dart';
import 'dart:math';

class FriendsNearbyPage extends StatefulWidget {
  const FriendsNearbyPage({Key? key}) : super(key: key);

  @override
  _FriendsNearbyPageState createState() => _FriendsNearbyPageState();
}

class _FriendsNearbyPageState extends State<FriendsNearbyPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();

  List<Friend> friends = [
    Friend(name: 'Chitranshu', icon: '🎮'),
    Friend(name: 'Ken', icon: '🕶️'),
    Friend(name: 'Navya', icon: '🎨'),
    Friend(name: 'Shubham', icon: '🚴‍♂️'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();

    // Change friend positions every 5 seconds
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        for (var friend in friends) {
          friend.distance = _random.nextDouble() * 80 + 10; // Between 10 and 90
          friend.angle = _random.nextDouble() * 2 * pi; // Random angle
        }
      });
    });

    // Schedule updates every 5 seconds
    Future.delayed(Duration.zero, updatePositions);
  }

  void updatePositions() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        for (var friend in friends) {
          friend.distance = _random.nextDouble() * 80 + 10; // Between 10 and 90
          friend.angle = _random.nextDouble() * 2 * pi; // Random angle
        }
      });
      updatePositions(); // Schedule next update
    });
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
        title: const Text('Friends Nearby'),
      ),
      body: Container(
        color: Colors.white, // Background color
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * pi,
                      child: CustomPaint(
                        size: const Size(400, 400), // Larger radar size
                        painter: RadarPainter(friends),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadarPainter extends CustomPainter {
  final List<Friend> friends;

  RadarPainter(this.friends);

  @override
  void paint(Canvas canvas, Size size) {
    final thickPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5; // Thicker radar lines

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    // Draw radar circles
    for (int i = 1; i <= 3; i++) {
      canvas.drawCircle(center, radius * i / 3, thickPaint);
    }

    // Draw radar cross lines
    canvas.drawLine(center, Offset(center.dx, 0), thickPaint);
    canvas.drawLine(center, Offset(center.dx, size.height), thickPaint);
    canvas.drawLine(center, Offset(0, center.dy), thickPaint);
    canvas.drawLine(center, Offset(size.width, center.dy), thickPaint);

    // Draw friends dynamically
    for (final friend in friends) {
      drawFriend(canvas, center, radius, friend);
    }
  }

  void drawFriend(Canvas canvas, Offset center, double radius, Friend friend) {
    final friendOffset = Offset(
      center.dx + radius * (friend.distance / 100) * cos(friend.angle),
      center.dy + radius * (friend.distance / 100) * sin(friend.angle),
    );

    // Draw PFP black outline
    final outlinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(friendOffset, 30, outlinePaint);

    // Draw white background for PFP
    final backgroundPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(friendOffset, 30, backgroundPaint);

    // Draw emoji inside PFP
    final textPainter = TextPainter(
      text: TextSpan(
        text: friend.icon,
        style: TextStyle(fontSize: 30), // Emoji size
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(
        canvas, friendOffset - Offset(textPainter.width / 2, textPainter.height / 2));

    // Draw name below PFP
    final namePainter = TextPainter(
      text: TextSpan(
        text: friend.name,
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    namePainter.paint(canvas, friendOffset + Offset(-namePainter.width / 2, 35));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Allow repaint for dynamic updates
  }
}

class Friend {
  String name;
  double distance;
  double angle;
  String icon;

  Friend({
    required this.name,
    this.distance = 0,
    this.angle = 0,
    required this.icon,
  });
}