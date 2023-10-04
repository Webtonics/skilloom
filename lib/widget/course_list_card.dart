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
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
            color: Colors.white, backgroundBlendMode: BlendMode.darken),
        child: ListTile(
          leading: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
              child: Image(
                image: NetworkImage(image),
              )),
          title: Text(title),
          subtitle: Text(
            subtitle,
            maxLines: 2,
          ),
          trailing: const Icon(
            Icons.arrow_circle_right_outlined,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
