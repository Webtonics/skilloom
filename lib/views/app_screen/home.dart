import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:skilloom/models/user_model.dart';
import 'package:skilloom/providers/user_provider.dart';

import '../../constants/colors.dart';
import '../../constants/spacing.dart';
import '../../widget/carosel_baner.dart';
import '../../widget/course_list_card.dart';
import 'course_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      // backgroundImage: NetworkImage(
                      //     "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
                      // backgroundImage: NetworkImage(user.photoURL!),
                    ),
                    title: Text("Welcome ${user.displayName}",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      "Student Account",
                      style: GoogleFonts.poppins(
                          color: Colors.black54, fontSize: 12),
                      // style: TextStyle(color: Colors.black54, fontSize: 14, ),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.white38,
                      radius: 19,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notification_important,
                            size: 21,
                          )),
                    ),
                  ),
                ),
              ),
              spacingH,
              spacingH,

              //search
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white54,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0)),
                        hintText: "Search Course",
                        prefixIcon: const Icon(Icons.search)),
                  ),
                ),
              ),
              spacingH,
              spacingH,

              spacingH,
              //image
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CaroselBanner(),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [const Text("Courses"), const Text("see all")],
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      const title = "How to Fundraise";
                      const subtitle = "Learning of Business in this field...";
                      final bookName = "$title ${[index]}";
                      return CourseListCard(
                        action: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => CourseDetailsScreen(
                                courseName: bookName,
                              )),
                        )),
                        title: title,
                        subtitle: subtitle,
                        image:
                            'https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y291cnNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
