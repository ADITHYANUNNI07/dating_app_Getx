// ignore_for_file: must_be_immutable

import 'package:dating_vista/core/color/color.dart';
import 'package:dating_vista/core/constant/constant.dart';
import 'package:dating_vista/core/widget/widget.dart';
import 'package:dating_vista/presentation/user%20details/functions/fun_user_details.dart';
import 'package:dating_vista/presentation/user%20details/widget/widget_user_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

ValueNotifier<bool?> dobValuenotifier = ValueNotifier(null);
ValueNotifier<Map<String, dynamic>> highlightValuenotifier = ValueNotifier({});
ValueNotifier<String> genderValueNotifier = ValueNotifier('');
ValueNotifier<List<String>> interestValueNotifier = ValueNotifier([]);

class UserDetailsScrn extends StatelessWidget {
  UserDetailsScrn({super.key}) {
    dobValuenotifier.value = null;
    highlightValuenotifier.value = {};
    genderValueNotifier.value = '';
    interestValueNotifier.value = [];
  }
  DateTime? dobDate;
  final dobController = TextEditingController();
  final jobController = TextEditingController();
  final desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorApp,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: colorWhite,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ValueListenableBuilder(
                    valueListenable: highlightValuenotifier,
                    builder: (context, highValue, _) {
                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Highlight',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.aBeeZee(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: colorApp,
                              ),
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 60,
                            decoration: BoxDecoration(
                                color: colorApp.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(40)),
                            child: Align(
                                child: Text(
                              '${highValue.length}/5',
                              style: const TextStyle(
                                  color: colorApp, fontWeight: FontWeight.w600),
                            )),
                          )
                        ],
                      );
                    }),
                sizedBox15H,
                ValueListenableBuilder(
                    valueListenable: highlightValuenotifier,
                    builder: (context, highlightVal, _) {
                      return LinearProgressIndicator(
                        minHeight: 7,
                        value: highlightVal.length * 0.2,
                        backgroundColor: colorApp.withOpacity(0.1),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(colorApp),
                        borderRadius: BorderRadius.circular(10),
                      );
                    }),
                sizedBox25H,
                HighlightContWidget(
                  controller: dobController,
                  content: 'Please provide your age in years',
                  widget: ValueListenableBuilder(
                      valueListenable: dobValuenotifier,
                      builder: (context, isDob, _) {
                        return TextFormField(
                          controller: dobController,
                          initialValue: null,
                          readOnly: true,
                          style: const TextStyle(color: colorBlack),
                          decoration: InputDecoration(
                              hintText: 'Exam Date',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              suffixIcon: isDob == null
                                  ? null
                                  : isDob == false
                                      ? const Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )),
                          onTap: () async {
                            dobChooserFn(context, dobController);
                          },
                        );
                      }),
                  title: 'How old are you?',
                ),
                sizedBox15H,
                HighlightContWidget(
                  title: 'What’s Your Gender?',
                  content: 'Tell us about your gender',
                  widget: ValueListenableBuilder(
                    valueListenable: genderValueNotifier,
                    builder: (context, gender, _) {
                      return Column(
                        children: [
                          RadioBtnWidget(
                            title: 'Male',
                            radioBtn: Radio(
                              value: 'Male',
                              groupValue: gender,
                              onChanged: (value) {},
                            ),
                            onTap: () {
                              genderChooseFN('Male');
                            },
                          ),
                          sizedBox5H,
                          RadioBtnWidget(
                            title: 'Female',
                            radioBtn: Radio(
                              value: 'Female',
                              groupValue: gender,
                              onChanged: (value) {},
                            ),
                            onTap: () {
                              genderChooseFN('Female');
                            },
                          ),
                          sizedBox5H,
                          RadioBtnWidget(
                            title: 'Other',
                            radioBtn: Radio(
                              value: 'Other',
                              groupValue: gender,
                              onChanged: (value) {},
                            ),
                            onTap: () {
                              genderChooseFN('Other');
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                sizedBox15H,
                HighlightContWidget(
                  title: 'Select up to 3 interest',
                  content:
                      'Provide us with further insights into your preferences',
                  widget: ValueListenableBuilder(
                    valueListenable: interestValueNotifier,
                    builder: (context, inList, _) {
                      return Column(
                        children: [
                          InterestOptionWidget(
                            interestTitle: 'Reading',
                            icon: Icons.book,
                            onTap: () {
                              interestedChooseFN('Reading');
                            },
                            selectedColor:
                                inList.contains('Reading') ? colorApp : null,
                          ),
                          sizedBox5H,
                          InterestOptionWidget(
                            interestTitle: 'Photography',
                            icon: Icons.camera,
                            onTap: () {
                              interestedChooseFN('Photography');
                            },
                            selectedColor: inList.contains('Photography')
                                ? colorApp
                                : null,
                          ),
                          sizedBox5H,
                          InterestOptionWidget(
                            interestTitle: 'Gaming',
                            icon: Icons.gamepad_outlined,
                            onTap: () {
                              interestedChooseFN('Gaming');
                            },
                            selectedColor:
                                inList.contains('Gaming') ? colorApp : null,
                          ),
                          sizedBox5H,
                          InterestOptionWidget(
                            interestTitle: 'Music',
                            icon: Icons.music_note,
                            onTap: () {
                              interestedChooseFN('Music');
                            },
                            selectedColor:
                                inList.contains('Music') ? colorApp : null,
                          ),
                          sizedBox5H,
                          InterestOptionWidget(
                            interestTitle: 'Travel',
                            icon: Icons.travel_explore,
                            onTap: () {
                              interestedChooseFN('Travel');
                            },
                            selectedColor:
                                inList.contains('Travel') ? colorApp : null,
                          ),
                          sizedBox5H,
                          InterestOptionWidget(
                            interestTitle: 'Painting',
                            icon: CupertinoIcons.paintbrush,
                            onTap: () {
                              interestedChooseFN('Painting');
                            },
                            selectedColor:
                                inList.contains('Painting') ? colorApp : null,
                          ),
                          sizedBox5H,
                          InterestOptionWidget(
                            interestTitle: 'Politics',
                            icon: CupertinoIcons.group,
                            onTap: () {
                              interestedChooseFN('Politics');
                            },
                            selectedColor:
                                inList.contains('Politics') ? colorApp : null,
                          ),
                          sizedBox5H,
                          InterestOptionWidget(
                            interestTitle: 'Charity',
                            icon: Icons.favorite,
                            onTap: () {
                              interestedChooseFN('Charity');
                            },
                            selectedColor:
                                inList.contains('Charity') ? colorApp : null,
                          ),
                          sizedBox5H,
                          InterestOptionWidget(
                            interestTitle: 'Cooking',
                            icon: Icons.food_bank_outlined,
                            onTap: () {
                              interestedChooseFN('Cooking');
                            },
                            selectedColor:
                                inList.contains('Cooking') ? colorApp : null,
                          ),
                          sizedBox5H,
                          InterestOptionWidget(
                            interestTitle: 'Pets',
                            icon: Icons.pets,
                            onTap: () {
                              interestedChooseFN('Pets');
                            },
                            selectedColor:
                                inList.contains('Pets') ? colorApp : null,
                          ),
                          sizedBox5H,
                          InterestOptionWidget(
                            interestTitle: 'Sports',
                            icon: Icons.sports_football,
                            onTap: () {
                              interestedChooseFN('Sports');
                            },
                            selectedColor:
                                inList.contains('Sports') ? colorApp : null,
                          ),
                          sizedBox5H,
                          InterestOptionWidget(
                            interestTitle: 'Fashion',
                            icon: Icons.style,
                            onTap: () {
                              interestedChooseFN('Fashion');
                            },
                            selectedColor:
                                inList.contains('Fashion') ? colorApp : null,
                          ),
                          sizedBox5H,
                        ],
                      );
                    },
                  ),
                ),
                sizedBox25H,
                HighlightContWidget(
                  title: 'Please provide your job',
                  content: 'Select Our Current Position',
                  widget: Column(
                    children: [
                      TextFormWidget(
                        label: 'Enter Your Job',
                        icon: Icons.work,
                        controller: jobController,
                        onChanged: (value) {
                          jobChooseFN(jobController);
                        },
                      )
                    ],
                  ),
                ),
                sizedBox25H,
                HighlightContWidget(
                  title: "Who I'm ?",
                  content: 'Please provide your details',
                  widget: Column(
                    children: [
                      TextFormAreaWidget(
                        label: 'Find it',
                        icon: Icons.description,
                        controller: desController,
                        onChanged: (value) {
                          desChooseFN(desController);
                        },
                      )
                    ],
                  ),
                ),
                sizedBox15H,
                SizedBox(
                  width: Get.width,
                  child: ElevatedBtnWidget(
                      onPressed: () {},
                      btnColor: colorApp,
                      title: 'Add Your Profile'.toUpperCase()),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
