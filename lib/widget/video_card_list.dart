import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  const LessonList({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
            // border: Bo,
            borderRadius: BorderRadius.all(Radius.circular(21)),
            border: Border.symmetric(
                vertical: BorderSide(
                  color: Colors.black,
                ),
                horizontal: BorderSide(color: Colors.black)),
            color: Colors.white,
          ),
          child: ListTile(
            leading: const Icon(
              Icons.play_circle,
              size: 30,
            ),
            title: Text("Title $index"),
            subtitle: Text("This is the description of $index"),
          )),
    );
  }
}
