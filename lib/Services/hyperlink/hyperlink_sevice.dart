import 'package:url_launcher/url_launcher.dart';

//link to external sources
class LinkService {
  launchURL(String link) async {
    var url = link;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
      );
    } else {
      // show url not found
      throw 'Could not launch $url';
    }
  }
}
