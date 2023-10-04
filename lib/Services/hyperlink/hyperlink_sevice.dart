import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skilloom/utils/error_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

//link to external sources
class LinkService {
  launchURL(String link, BuildContext context) async {
    var url = link;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return const MyErrorDialog(
                title: "Not Found",
                content: " The discussion group Link could not be found");
          });
      // throw 'Could not launch $url';
    }
  }
}
