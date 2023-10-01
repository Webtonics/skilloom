import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skilloom/Services/authservice/user_services.dart';
import 'package:skilloom/constants/spacing.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          "My Courses",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                AuthService().signout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Your Progress",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            spacingH,
            Expanded(
              flex: 2,
              child: ListView(children: [
                Container(
                    height: 120,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        // color: Colors.greenAccent,
                        // color: Colors.deepOrangeAccent,
                        color: Colors.black,
                        image: DecorationImage(
                            // invertColors: true,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.darken),
                            // opacity: 0.6,
                            image: const NetworkImage(
                                "https://images.unsplash.com/photo-1618044733300-9472054094ee?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGRhdGElMjBhbmFseXNpc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"))),
                    child: Row(children: [
                      //image
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Track Your Progress",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Get Started",
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ))
                        ],
                      ),
                    ]))
              ]),
            ),
            spacingH,
            const Text(
              "Other Courses",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            spacingH,
            Expanded(
              flex: 4,
              child: AspectRatio(
                aspectRatio: 5,
                child: SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                      itemCount: 12,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            width: 120,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: const [
                                Expanded(
                                  child: Image(
                                    image: NetworkImage(
                                        "https://img.freepik.com/free-photo/medium-shot-man-waving-laptop_23-2149045941.jpg?size=626&ext=jpg"),
                                  ),
                                ),
                                Text("Title"),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
