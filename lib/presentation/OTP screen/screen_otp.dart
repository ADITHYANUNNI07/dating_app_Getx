import 'package:dating_vista/core/color/color.dart';
import 'package:dating_vista/core/constant/constant.dart';
import 'package:dating_vista/core/widget/widget.dart';
import 'package:dating_vista/presentation/user%20details/screen_user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OTPScrn extends StatelessWidget {
  OTPScrn({super.key});
  final otpcontroller = TextEditingController();
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
              bottom: Get.height * 0.3,
              child: SizedBox(
                width: Get.width,
                child: Align(
                  child: Container(
                    width: Get.width - 30,
                    decoration: BoxDecoration(
                        color: colorApp.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(14),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width,
                            child: const Column(
                              children: [
                                Text(
                                  'Phone Number Verification',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: colorWhite),
                                ),
                                Text(
                                  "Enter the code sent to the Number +91 9605493733",
                                  style: TextStyle(
                                      color: colorWhite, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          sizedBox10H,
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Enter OTP',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: colorWhite,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                sizedBox15H,
                                SizedBox(
                                  width: Get.width,
                                  child: Pinput(
                                    controller: otpcontroller,
                                  ),
                                ),
                                sizedBox15H,
                                SizedBox(
                                  width: Get.width,
                                  child: ElevatedBtnWidget(
                                      onPressed: () {
                                        Get.to(() => UserDetailsScrn());
                                      },
                                      title: 'verify'.toUpperCase(),
                                      btnColor: colorApp),
                                ),
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
