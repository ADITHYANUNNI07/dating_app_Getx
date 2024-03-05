// import 'package:dating_vista/core/color/color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DialogBoxControllerClass extends GetxController {
//   void showDialogBox(StudentModel studentModel) {
//     Get.defaultDialog(
//         title: 'Delete Student',
//         titleStyle: const TextStyle(color: colorBlack),
//         content: Text(
//           'Are you sure you want to delete this ${studentModel.name} ?',
//           style: const TextStyle(color: colorBlack),
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               Get.back();
//             },
//             child: const Text('cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               Get.back();
//               await deleteStudentListFormDB(studentModel);
//             },
//             child: const Text('Ok'),
//           )
//         ]);
//   }
// }
