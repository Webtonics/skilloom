import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skilloom/Services/hyperlink/hyperlink_sevice.dart';
import 'package:skilloom/constants/theme/theme.dart';
import 'package:skilloom/utils/elevated_buttons.dart';
import 'package:skilloom/widget/video_card_list.dart';

import '../../constants/spacing.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key, required this.courseName, this.snap});

  final String courseName;
  final snap;

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {

  bool enrolled = false;

  //function to handle enroll task 
  bool enroll(){
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.snap['title']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("${widget.snap['thumbnail']}")),
                ),
              ),
              spacingH,
              Center(
                child: Text(
                  "${widget.courseName} information",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              spacingH,
              Center(
                child: Text("${widget.snap['description']} "),
              ),
              spacingH,
              
              enrolled == false ? MyElevattedButton(
                  title: "Enroll",
                  color: Colors.black,
                  action: () {
                   setState(() {
                     enrolled = true;
                   });
                  })
              :MyElevattedButton(
                  title: "Full Note",
                  action: () {
                    LinkService()
                        .launchURL(widget.snap['fullNote'], context);
                  }),
              spacingH,
              const Text(
                "All Lessons",
                style: headingSmall,
              ),
              spacingH,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: double.maxFinite,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: ((context, index) {
                          return LessonList(
                            index: index,
                          );
                        }))),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          LinkService().launchURL(widget.snap['groupChat'], context);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}

// class VisdeoList extends StatelessWidget {
//   const VisdeoList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: 7,
//         itemBuilder: ((context, index) {
//           return const LessonList();
//         }));
//   }
// }
