// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// class FindFriendsPage extends StatelessWidget {
//   const FindFriendsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Find Friends'),
//         backgroundColor: const Color(0xFF059862),
//       ),
//       body: const Center(
//         child: Text(
//           'This is where you’ll implement finding friends nearby!',
//           style: TextStyle(fontSize: 18),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';




class FindFriendsPage extends StatefulWidget {
  const FindFriendsPage({super.key});

  @override
  State<FindFriendsPage> createState() => _FindFriendsPageState();
}

class _FindFriendsPageState extends State<FindFriendsPage> {
  @override
  void initState() {
    super.initState();
    _askPermissionsAndStartBluetooth();
  }

  Future<void> _askPermissionsAndStartBluetooth() async {
    final bluetoothConnect = await Permission.bluetoothConnect.request();
    final bluetoothScan = await Permission.bluetoothScan.request();
    final location = await Permission.locationWhenInUse.request();

    if (bluetoothConnect.isGranted && bluetoothScan.isGranted && location.isGranted) {
      _checkBluetoothStatus();
    } else {
      _showPermissionDeniedDialog();
    }
  }

  void _checkBluetoothStatus() async {
    FlutterBluePlus.adapterState.listen((state) {
      if (state != BluetoothAdapterState.on) {
        _showBluetoothOffDialog();
      }
    });

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Permission Required"),
        content: const Text("Bluetooth and Location permissions are needed to find friends."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  void _showBluetoothOffDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Bluetooth Off"),
        content: const Text("Please enable Bluetooth from your settings to find friends."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F5D0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFCDE8BA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Friends',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.person_add_alt_1, color: Colors.black),
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search friends...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildFriendTile("Alex Johnson", "Online"),
                _buildFriendTile("Sarah Williams", "Last seen 2h ago"),
                _buildFriendTile("Michael Chen", "Online"),
                _buildFriendTile("Emily Rodriguez", "Last seen yesterday"),
                _buildFriendTile("David Thompson", "Online"),
                _buildFriendTile("Jessica Lee", "Last seen 5h ago"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: FloatingActionButton(
              backgroundColor: const Color(0xFF80C67E),
              onPressed: () {},
              child: const Icon(Icons.group, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFriendTile(String name, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFB7E29B),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xFF6BA86F),
              radius: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(status,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person_add_alt_1),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

