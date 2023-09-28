import 'package:image_picker/image_picker.dart';

pickimage(ImageSource source) async {
  //1. instantiate the image picker package
  final ImagePicker imagepicker = ImagePicker();
  //get file
  XFile? file = await imagepicker.pickImage(source: source);

  //Logic to check if null
  if (file != null) {
    return file.readAsBytes();
  } else {
    print("No image selected");
  }
}
