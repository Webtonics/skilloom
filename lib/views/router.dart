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
  // late Future<void> _init;
  @override
  void initState() {
    addUserProvider();
    super.initState();
  }

  //function to add user provider
  addUserProvider() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
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
    // return FutureBuilder(
    //     future: _init,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return Scaffold(
    //           body: pages[currentIndex],
    //           bottomNavigationBar: BottomNavigationBar(
    //             fixedColor: Colors.deepPurple,
    //             unselectedItemColor: Colors.black54,
    //             type: BottomNavigationBarType.fixed,
    //             backgroundColor: Colors.white,
    //             items: const [
    //               BottomNavigationBarItem(
    //                   icon: Icon(
    //                     Icons.home,
    //                   ),
    //                   label: "Home"),
    //               BottomNavigationBarItem(
    //                   icon: Icon(
    //                     Icons.book_rounded,
    //                   ),
    //                   label: "Courses"),
    //               BottomNavigationBarItem(
    //                   icon: Icon(
    //                     Icons.help,
    //                   ),
    //                   label: "Help"),
    //               BottomNavigationBarItem(
    //                   icon: Icon(
    //                     Icons.settings,
    //                   ),
    //                   label: "Settings"),
    //             ],
    //             currentIndex: currentIndex,
    //             onTap: (value) {
    //               setState(() {
    //                 currentIndex = value;
    //               });
    //             },
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return const Text("An error occured");
    //       } else {
    //         return const Center(child: CircularProgressIndicator());
    //       }
    //     });

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.deepPurple,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
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
