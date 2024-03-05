import 'package:dating_vista/core/color/color.dart';
import 'package:dating_vista/core/constant/constant.dart';
import 'package:dating_vista/core/widget/widget.dart';
import 'package:dating_vista/presentation/login%20screen/screen_login.dart';
import 'package:dating_vista/presentation/signup%20screen/screen_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorApp,
      child: SafeArea(
          child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: Image.asset('assets/images/welcomeimage.jpg',
                  fit: BoxFit.cover),
            ),
            Container(
              width: Get.width,
              height: Get.height,
              color: colorBlack.withOpacity(0.5),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                width: Get.width,
                height: Get.height * 0.4,
                child: Column(
                  children: [
                    const Text(
                      'Discover Love where your story begins.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorWhite,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    sizedBox10H,
                    const Text(
                      'Join us to discover your ideal partner and ignite the sparks of romance in your journey.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorWhite,
                          fontSize: 19,
                          fontWeight: FontWeight.w400),
                    ),
                    sizedBox15H,
                    SizedBox(
                        width: Get.width,
                        child: ElevatedBtnWidget(
                          onPressed: () {
                            Get.to(() => const LoginScrn());
                          },
                          title: 'Login'.toUpperCase(),
                          btnColor: colorApp,
                        )),
                    sizedBox5H,
                    SizedBox(
                        width: Get.width,
                        child: ElevatedBtnWidget(
                          onPressed: () {
                            Get.to(() => const SignUpScrn());
                          },
                          title: 'Signup'.toUpperCase(),
                          borderColor: colorWhite,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
