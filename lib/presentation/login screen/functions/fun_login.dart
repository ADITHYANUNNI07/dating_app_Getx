import 'package:dating_vista/presentation/login%20screen/screen_login.dart';
import 'package:dating_vista/presentation/signup%20screen/screen_signup.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

void validateEmail(String val) {
  if (EmailValidator.validate(val)) {
    emailValueNotifier.value = true;
  } else {
    emailValueNotifier.value = false;
  }
}

void validatePassword(String val) {
  if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(val)) {
    passwordValueNotifier.value = true;
  } else {
    passwordValueNotifier.value = false;
  }
}

void validatePhone(String val) {
  if (val.trim().length == 10 && val.isNum) {
    phoneNoValueNotifier.value = true;
  } else {
    phoneNoValueNotifier.value = false;
  }
}
