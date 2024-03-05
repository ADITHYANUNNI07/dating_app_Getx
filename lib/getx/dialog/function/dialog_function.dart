// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:dating_vista/getx/dialog/dialog.dart';
import 'package:dating_vista/presentation/user%20details/screen_user_details.dart';

void collegeNameFN(String val) {
  if (val.trim().isEmpty || val.trim().length < 10) {
    isCollegeName.value = false;
  } else {
    isCollegeName.value = true;
  }
}

void percentageFN(String val) {
  if (RegExp(r'^\d{1,3}(\.\d{1,2})?%$').hasMatch(val)) {
    isPercentage.value = true;
  } else {
    isPercentage.value = false;
  }
}

void addQualiFN(String collegeName, String percentage) {
  eduQualiNoti.value.add({
    'collegeName': collegeName,
    'percentage': percentage,
    'image': imageValueNotifier.value,
  });
  highlightValuenotifier.value['qualification'] = eduQualiNoti.value;
  highlightValuenotifier.notifyListeners();
  eduQualiNoti.notifyListeners();
  print(eduQualiNoti.value);
}
