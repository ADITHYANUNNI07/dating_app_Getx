import 'package:dating_vista/core/color/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarControllerClass extends GetxController {
  void showSnackBar(
      {required String title, required String content, Color? errorcolor}) {
    Get.snackbar(
      title,
      content,
      backgroundColor: errorcolor ?? colorApp,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      colorText: colorWhite,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      mainButton: TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text(
          'Dismiss',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
