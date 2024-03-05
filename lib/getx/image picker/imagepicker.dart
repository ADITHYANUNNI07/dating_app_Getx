import 'dart:io';

import 'package:dating_vista/getx/snackbar/snackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerControllerClass extends GetxController {
  Future<File?> selectImageFromGallaryOrCamera(ImageSource option) async {
    File? image;
    try {
      final pickedImage = await ImagePicker().pickImage(source: option);
      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    } catch (e) {
      final SnackBarControllerClass snackbarController =
          Get.find<SnackBarControllerClass>();
      snackbarController.showSnackBar(title: 'Error', content: e.toString());
    }
    return image;
  }
}
