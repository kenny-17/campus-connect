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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
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
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: CustomPaint(
                      size: const Size(300, 300),
                      painter: RadarPainter(),
                    ),
                  );
                },
              ),
            ),
          ),
          const Text('Friend Cards Below (Dummy Data)', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class RadarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    for (int i = 1; i <= 3; i++) {
      canvas.drawCircle(center, radius * i / 3, paint);
    }

    canvas.drawLine(center, Offset(center.dx, 0), paint);
    canvas.drawLine(center, Offset(center.dx, size.height), paint);
    canvas.drawLine(center, Offset(0, center.dy), paint);
    canvas.drawLine(center, Offset(size.width, center.dy), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
q