import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickImageUtil {
  static Future<File?> pickImage({ImageSource? source}) async {
    final XFile? image = await ImagePicker().pickImage(source: source ?? ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }
}
