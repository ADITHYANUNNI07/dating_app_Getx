// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:dating_vista/getx/snackbar/snackbar.dart';
import 'package:dating_vista/presentation/user%20details/screen_user_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void dobChooserFn(
    BuildContext context, TextEditingController dobController) async {
  var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030));
  if (date != null) {
    //dobDate = date;
    dobController.text = DateFormat('dd MMM yyyy').format(date);
    Duration difference = DateTime.now().difference(date);
    int age = (difference.inDays / 365).floor();
    if (age < 18) {
      dobValuenotifier.value = false;
      highlightValuenotifier.value.remove('dob');
      highlightValuenotifier.notifyListeners();
      SnackBarControllerClass()
          .showSnackBar(title: 'Above 17', content: 'Age must be above 17');
    } else {
      dobValuenotifier.value = true;
      highlightValuenotifier.value['dob'] = dobController.text;
      highlightValuenotifier.notifyListeners();
    }
  }
}

void genderChooseFN(String gender) {
  genderValueNotifier.value = gender;
  highlightValuenotifier.value['gender'] = gender;
  highlightValuenotifier.notifyListeners();
}

void interestedChooseFN(String interest) {
  if (interestValueNotifier.value.contains(interest)) {
    interestValueNotifier.value.remove(interest);
    if (interestValueNotifier.value.isEmpty) {
      highlightValuenotifier.value.remove('interest');
    }
    interestValueNotifier.notifyListeners();
    highlightValuenotifier.notifyListeners();
  } else {
    interestValueNotifier.value.add(interest);
    highlightValuenotifier.value['interest'] = interestValueNotifier.value;
    interestValueNotifier.notifyListeners();
    highlightValuenotifier.notifyListeners();
  }
}

void jobChooseFN(TextEditingController jobController) {
  if (jobController.text.trim().length > 4) {
    highlightValuenotifier.value['job'] = jobController.text;
    highlightValuenotifier.notifyListeners();
  } else {
    highlightValuenotifier.value.remove('job');
    highlightValuenotifier.notifyListeners();
  }
}

void desChooseFN(TextEditingController desController) {
  if (desController.text.trim().length > 70) {
    highlightValuenotifier.value['description'] = desController.text;
    highlightValuenotifier.notifyListeners();
  } else {
    highlightValuenotifier.value.remove('description');
    highlightValuenotifier.notifyListeners();
  }
}
