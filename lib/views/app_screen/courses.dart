import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skilloom/constants/spacing.dart';
import 'package:skilloom/widget/carosel_baner.dart';

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
        title: const Text("My courses"),
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
                      color: Colors.deepOrangeAccent,
                    ),
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
                            width: 120,
                            height: 80,
                            color: Colors.deepOrange,
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
