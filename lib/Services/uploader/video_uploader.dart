import 'package:image_picker/image_picker.dart';

pickVideo(source) async {
  ImagePicker picker = ImagePicker();
  XFile? video = await picker.pickVideo(source: source);
  if (video != null) {
    return video.readAsBytes();
  } else {
    print("No video Selected");
  }
}
