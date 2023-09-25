import 'package:flutter/material.dart';

class CourseListCard extends StatelessWidget {
  const CourseListCard(
      {super.key,
      required this.action,
      required this.title,
      required this.subtitle,
      required this.image});
  final VoidCallback action;
  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListTile(
          leading: CircleAvatar(child: Image(image: NetworkImage(image))),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(
            Icons.arrow_circle_right_outlined,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
