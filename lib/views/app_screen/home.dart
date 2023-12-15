import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:skilloom/Services/firestoreservice/firestore_service.dart';
import 'package:skilloom/Services/uploader/note_uploader.dart';
import 'package:skilloom/models/user_model.dart';
import 'package:skilloom/providers/user_provider.dart';
import 'package:skilloom/views/app_screen/notifications.dart';

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
    User? user = Provider.of<UserProvider>(context).getUser;

    // final userProvider = Provider.of<UserProvider>(context);
    // print(userProvider); // Check if userProvider is not null.
    // final user = userProvider.getUser;
    // print(user); // Check if user is not null.

    if (user != null) {
      return Scaffold(
        backgroundColor: scaffoldColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Container(
              height: double.maxFinite,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(user.photoURL),
                        ),
                        title: Text("Welcome ${user.displayName}",
                            maxLines: 1,
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          "${user.role} Account",
                          style: GoogleFonts.poppins(
                              color: Colors.black54, fontSize: 12),
                          // style: TextStyle(color: Colors.black54, fontSize: 14, ),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.white38,
                          radius: 19,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                              },
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
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text("Courses"), Text("see all")],
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: StreamBuilder(
                          stream: FirestoreService().getallCourses(),
                          builder: ((context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final title = snapshot.data!.docs[index]
                                        .data()['title']
                                        .toString();
                                    final subtitle = snapshot.data!.docs[index]
                                        .data()['description'];
                                    final bookName = snapshot.data!.docs[index]
                                        .data()['title'];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CourseListCard(
                                          action: () => Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: ((context) =>
                                                    CourseDetailsScreen(
                                                      snap: snapshot
                                                          .data!.docs[index]
                                                          .data(),
                                                      courseName: bookName,
                                                    )),
                                              )),
                                          title: title,
                                          subtitle: subtitle,
                                          image: snapshot.data!.docs[index]
                                              .data()['thumbnail']),
                                    );
                                  });
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return const Center(
                                  child: Text("Unexpected error"));
                            }
                          }))),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
