// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilloom/providers/user_provider.dart';
import 'package:skilloom/views/app_screen/courses.dart';
import 'package:skilloom/views/app_screen/home.dart';
import 'package:skilloom/views/app_screen/settings.dart';

import '../models/user_model.dart';
import 'app_screen/help.dart';

class MyAppRoute extends StatefulWidget {
  const MyAppRoute({super.key});

  @override
  State<MyAppRoute> createState() => _MyAppRouteState();
}

class _MyAppRouteState extends State<MyAppRoute> {
  @override
  void initState() {
    addUserProvider();
    super.initState();
  }

  //function to add user provider
  addUserProvider() async {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    await userProvider.refreshUser();
  }

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
        fixedColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book_rounded,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.help,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: ""),
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
