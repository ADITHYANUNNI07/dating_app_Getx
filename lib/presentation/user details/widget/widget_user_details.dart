import 'package:dating_vista/core/color/color.dart';
import 'package:dating_vista/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HighlightContWidget extends StatelessWidget {
  const HighlightContWidget({
    super.key,
    this.controller,
    required this.title,
    required this.content,
    required this.widget,
  });

  final TextEditingController? controller;

  final String title;
  final String content;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 2,
              spreadRadius: 1),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.aBeeZee(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: colorApp,
            ),
          ),
          sizedBox10H,
          Text(
            content,
            style: const TextStyle(color: colorBlack, fontSize: 15),
          ),
          sizedBox25H,
          widget
        ],
      ),
    );
  }
}

class RadioBtnWidget extends StatelessWidget {
  const RadioBtnWidget({
    Key? key,
    required this.title,
    required this.radioBtn,
    this.onTap,
  }) : super(key: key);
  final String title;
  final Widget radioBtn;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).highlightColor,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).cardColor),
              child: radioBtn,
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestOptionWidget extends StatelessWidget {
  const InterestOptionWidget({
    super.key,
    required this.interestTitle,
    required this.icon,
    this.onTap,
    this.selectedColor,
  });
  final String interestTitle;
  final IconData? icon;
  final void Function()? onTap;
  final Color? selectedColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(10),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedColor ?? Theme.of(context).highlightColor,
        ),
        child: Row(
          children: [
            Icon(icon, color: selectedColor != null ? colorWhite : null),
            sizedBox10W,
            Text(
              interestTitle,
              style:
                  TextStyle(color: selectedColor != null ? colorWhite : null),
            )
          ],
        ),
      ),
    );
  }
}
