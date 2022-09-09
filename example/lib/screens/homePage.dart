import 'package:example/screens/heart.dart';
import 'package:example/screens/measures.dart';
import 'package:example/screens/settings.dart';
import 'package:example/screens/sleep.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    Settings(),
    Heart(),
    Sleep(),
    Measures(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
      ),
      body: Center(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Heart'),
          BottomNavigationBarItem(icon: Icon(Icons.bedtime), label: 'Sleep'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_run_outlined), label: 'Measures')
        ],
      ),
    );
  }
} //HomePage
