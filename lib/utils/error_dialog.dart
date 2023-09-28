import 'package:flutter/material.dart';

class MyErrorDialog extends StatelessWidget {
  const MyErrorDialog({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
  });
  final String title;
  final String content;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(icon),
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"))
      ],
    );
  }
}

// class ShoewDialog extends StatelessWidget {
//   const ShoewDialog({super.key});

//   showdialog(BuildContext context) async {
//     showDialog(
//         context: (context),
//         builder: (context) {
//           return const MyErrorDialog();
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     showdialog(context);
//     throw UnimplementedError();
//   }
// }
