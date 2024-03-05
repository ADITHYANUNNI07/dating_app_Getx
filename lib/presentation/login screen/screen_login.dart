import 'package:dating_vista/core/color/color.dart';
import 'package:dating_vista/core/constant/constant.dart';
import 'package:dating_vista/core/widget/widget.dart';
import 'package:dating_vista/presentation/login%20screen/functions/fun_login.dart';
import 'package:dating_vista/presentation/signup%20screen/screen_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ValueNotifier<bool?> emailValueNotifier = ValueNotifier<bool?>(null);
ValueNotifier<bool?> passwordValueNotifier = ValueNotifier<bool?>(null);

class LoginScrn extends StatelessWidget {
  const LoginScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorApp,
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(children: [
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: Image.asset('assets/images/loginimage.jpg',
                  fit: BoxFit.cover),
            ),
            Container(
              width: Get.width,
              height: Get.height,
              color: colorBlack.withOpacity(0.5),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(
                      text: 'Find Your ',
                      style: TextStyle(
                          color: colorWhite,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                            text: 'Partner..',
                            style: TextStyle(color: colorApp)),
                      ])),
                  Text(
                    "Let's find your real life partner and enjoy your good life from now!",
                    style: TextStyle(color: colorWhite, fontSize: 13),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: Get.height * 0.2,
              child: SizedBox(
                width: Get.width,
                child: Align(
                  child: Container(
                    width: Get.width - 30,
                    height: Get.height * 0.6,
                    decoration: BoxDecoration(
                        color: colorApp.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(14),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width,
                            child: const Text(
                              'Welcome Back..',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: colorWhite),
                            ),
                          ),
                          sizedBox10H,
                          SizedBox(
                            height: Get.height * 0.49,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Email',
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                sizedBox5H,
                                ValueListenableBuilder(
                                    valueListenable: emailValueNotifier,
                                    builder: (context, isEmail, _) {
                                      return TextFormWidget(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        label: 'Email',
                                        icon: Icons.email,
                                        suffixicon: isEmail == null
                                            ? null
                                            : isEmail == false
                                                ? Icons.cancel
                                                : Icons.check_circle,
                                        suffixIconColor: isEmail == null
                                            ? null
                                            : isEmail == false
                                                ? Colors.red
                                                : Colors.green,
                                        hintText: 'Eg. example@gmail.com',
                                        onChanged: (value) {
                                          validateEmail(value!);
                                        },
                                      );
                                    }),
                                sizedBox10H,
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                sizedBox5H,
                                ValueListenableBuilder(
                                    valueListenable: passwordValueNotifier,
                                    builder: (context, isPass, _) {
                                      return TextFormWidget(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        label: 'Password',
                                        icon: Icons.fingerprint,
                                        suffixicon: isPass == null
                                            ? null
                                            : isPass == false
                                                ? Icons.cancel
                                                : Icons.check_circle,
                                        suffixIconColor: isPass == null
                                            ? null
                                            : isPass == false
                                                ? Colors.redAccent
                                                : Colors.green,
                                        hintText: "Eg. Example@123",
                                        onChanged: (value) {
                                          validatePassword(value!);
                                        },
                                      );
                                    }),
                                sizedBox15H,
                                SizedBox(
                                  width: Get.width,
                                  child: ElevatedBtnWidget(
                                      onPressed: () {},
                                      title: 'Login'.toUpperCase(),
                                      btnColor: colorApp),
                                ),
                                sizedBox15H,
                                SizedBox(
                                  width: Get.width,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          alignment: Alignment.center),
                                      onPressed: () {
                                        Get.off(() => const SignUpScrn());
                                      },
                                      child: const Text.rich(
                                        TextSpan(
                                          text: "Don't have an Account? ",
                                          style: TextStyle(color: colorWhite),
                                          children: [
                                            TextSpan(
                                              text: 'Signup',
                                              style: TextStyle(
                                                color: colorApp,
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
