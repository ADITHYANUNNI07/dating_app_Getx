import 'dart:io';

import 'package:dating_vista/core/color/color.dart';
import 'package:dating_vista/core/widget/widget.dart';
import 'package:dating_vista/getx/dialog/function/dialog_function.dart';
import 'package:dating_vista/getx/image%20picker/imagepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

ValueNotifier<File?> imageValueNotifier = ValueNotifier(null);
GlobalKey<FormState> formKeyQuali = GlobalKey();
ValueNotifier<bool?> isCollegeName = ValueNotifier(null);
ValueNotifier<bool?> isPercentage = ValueNotifier(null);

class DialogBoxControllerClass extends GetxController {
  void showDialogBox() {
    imageValueNotifier.value = null;
    isCollegeName.value = null;
    isPercentage.value = null;
    final collegeNameContr = TextEditingController();
    final percentageContr = TextEditingController();
    Get.defaultDialog(
        title: 'Qualification',
        titleStyle: const TextStyle(color: colorBlack),
        content: const Text(
          'Select College logo, college name and percentage',
          style: TextStyle(color: colorBlack),
        ),
        actions: [
          Stack(
            children: [
              ValueListenableBuilder(
                valueListenable: imageValueNotifier,
                builder: (context, image, child) => CircleAvatar(
                    radius: 60,
                    backgroundImage: image != null ? FileImage(image) : null,
                    child: image == null ? const Icon(Icons.school) : null),
              ),
              Positioned(
                  bottom: 0,
                  right: 10,
                  child: InkWell(
                    onTap: () async {
                      imageValueNotifier.value =
                          await ImagePickerControllerClass()
                              .selectImageFromGallaryOrCamera(
                                  ImageSource.gallery);
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 23,
                        child: Icon(CupertinoIcons.photo),
                      ),
                    ),
                  ))
            ],
          ),
          ValueListenableBuilder(
            valueListenable: isCollegeName,
            builder: (context, iscollege, child) => TextFormWidget(
              controller: collegeNameContr,
              label: 'College/School Name',
              icon: Icons.school,
              onChanged: (value) {
                collegeNameFN(value!);
              },
              suffixIconColor: iscollege == null
                  ? null
                  : iscollege == false
                      ? Colors.red
                      : Colors.green,
              suffixicon: iscollege == null
                  ? null
                  : iscollege == false
                      ? Icons.cancel
                      : Icons.check_circle,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: isPercentage,
            builder: (context, isper, child) => TextFormWidget(
              controller: percentageContr,
              label: 'Mark in percentage',
              icon: Icons.percent,
              onChanged: (value) {
                percentageFN(value!);
              },
              suffixIconColor: isper == null
                  ? null
                  : isper == false
                      ? Colors.red
                      : Colors.green,
              suffixicon: isper == null
                  ? null
                  : isper == false
                      ? Icons.cancel
                      : Icons.check_circle,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('cancel'),
          ),
          ValueListenableBuilder(
            valueListenable: imageValueNotifier,
            builder: (context, image, child) => ValueListenableBuilder(
              valueListenable: isPercentage,
              builder: (context, isper, child) => ValueListenableBuilder(
                valueListenable: isCollegeName,
                builder: (context, iscoll, child) =>
                    iscoll == true && isper == true && image != null
                        ? ElevatedButton(
                            onPressed: () async {
                              Get.back();
                              addQualiFN(
                                  collegeNameContr.text, percentageContr.text);
                            },
                            child: const Text('Ok'),
                          )
                        : ElevatedBtnWidget(onPressed: () {}, title: 'ok'),
              ),
            ),
          )
        ]);
  }
}
