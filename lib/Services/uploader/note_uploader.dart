import 'dart:io';

import 'package:file_picker/file_picker.dart';

addNote() async {
  FilePickerResult? pickerResult = await FilePicker.platform.pickFiles();

  if (pickerResult != null) {
    File file = File(pickerResult.files.single.path!);
    return file.readAsBytes();
  } else {
    print('File not selected');
  }
}
