// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skilloom/views/app_screen/courses.dart';
import 'package:skilloom/views/app_screen/home.dart';
import 'package:skilloom/views/app_screen/settings.dart';

import 'app_screen/help.dart';

class MyAppRoute extends StatefulWidget {
  const MyAppRoute({super.key});

  @override
  State<MyAppRoute> createState() => _MyAppRouteState();
}

class _MyAppRouteState extends State<MyAppRoute> {
  int currentIndex = 0;
  List<Widget> pages = const [
    HomeScreen(),
    Courses(),
    HelpScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        backgroundColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book_rounded,
              ),
              label: "Courses"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.help,
              ),
              label: "Help"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Settings"),
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
