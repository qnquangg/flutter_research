import 'package:flutter/material.dart';
import 'package:flutter_research/videos.dart';
import 'package:media_kit/media_kit.dart';

import 'ip_streaming.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getChild() {
    switch (_selectedIndex) {
      case 0:
        return const Videos();
      case 1:
        WidgetsFlutterBinding.ensureInitialized();
        // Necessary initialization for package:media_kit.
        MediaKit.ensureInitialized();
        return const MyScreen();
      default:
        return Text(
          "Exit page: In development",
          style: TextStyle(color: Colors.amber.shade900, fontSize: 20),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zien Training'),
      ),
      body: Center(
        child: getChild(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning_outlined),
            label: 'Streaming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Exit',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
