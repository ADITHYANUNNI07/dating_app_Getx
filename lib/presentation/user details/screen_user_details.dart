// ignore_for_file: must_be_immutable, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:dating_vista/core/color/color.dart';
import 'package:dating_vista/core/constant/constant.dart';
import 'package:dating_vista/core/widget/widget.dart';
import 'package:dating_vista/getx/dialog/dialog.dart';
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
final DialogBoxControllerClass dialogController =
    Get.put(DialogBoxControllerClass());

ValueNotifier<List<Map<String, dynamic>>> eduQualiNoti = ValueNotifier([]);
ValueNotifier<bool> ishobbiesValnoti = ValueNotifier(false);
ValueNotifier<TextEditingController> hobbiesControlValnoti =
    ValueNotifier(TextEditingController());
ValueNotifier<List<String>> hobbiesListValueNoti = ValueNotifier([]);
ValueNotifier<String> placeValueNoti = ValueNotifier('');
ValueNotifier<String> districtValueNoti = ValueNotifier('');
ValueNotifier<String> stateValueNoti = ValueNotifier('');

class UserDetailsScrn extends StatelessWidget {
  UserDetailsScrn({super.key}) {
    dobValuenotifier.value = null;
    highlightValuenotifier.value = {};
    genderValueNotifier.value = '';
    interestValueNotifier.value = [];
    eduQualiNoti.value = [];
    ishobbiesValnoti.value = false;
    hobbiesControlValnoti.value.text = '';
  }
  DateTime? dobDate;
  final dobController = TextEditingController();
  final jobController = TextEditingController();
  final desController = TextEditingController();
  final addressController = TextEditingController();
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
                              '${highValue.length}/8',
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
                        value: highlightVal.length * 0.125,
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
                sizedBox25H,
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
                sizedBox25H,
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
                sizedBox25H,
                HighlightContWidget(
                  title: 'Education Qualification',
                  content: 'Please Provide your Qualification',
                  widget: Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: eduQualiNoti,
                        builder: (context, isEduList, child) => SizedBox(
                          height: 79.0 * isEduList.length,
                          child: ListView.separated(
                            itemCount: isEduList.length,
                            itemBuilder: (context, index) => Container(
                              width: Get.width,
                              padding: const EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorApp,
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(isEduList[index]['image']),
                                ),
                                title: Text(
                                  isEduList[index]['collegeName'],
                                  style: const TextStyle(
                                      color: colorWhite,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                subtitle: Text(
                                  isEduList[index]['percentage'],
                                  style: const TextStyle(color: colorWhite),
                                ),
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    eduQualiNoti.value.removeAt(index);
                                    eduQualiNoti.notifyListeners();
                                    if (eduQualiNoti.value.isEmpty) {
                                      highlightValuenotifier.value
                                          .remove('qualification');
                                      highlightValuenotifier.notifyListeners();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorWhite),
                                  child: const Text(
                                    'Remove',
                                    style: TextStyle(color: colorApp),
                                  ),
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) => sizedBox5H,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          dialogController.showDialogBox();
                        },
                        child: Container(
                          width: Get.width,
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).highlightColor,
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.add_box),
                              sizedBox15W,
                              Text('Add Qualification')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBox20H,
                HighlightContWidget(
                  title: "Your Hobbies ?",
                  content: 'Please Provide Your Hobbies',
                  widget: Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: hobbiesControlValnoti,
                        builder: (context, hobbiesController, child) =>
                            ValueListenableBuilder(
                          valueListenable: ishobbiesValnoti,
                          builder: (context, isHobi, child) => TextFormWidget(
                            controller: hobbiesController,
                            label: 'Enter your hobbies',
                            icon: Icons.sports,
                            onChanged: (val) {
                              hobbiesFN(val!);
                            },
                            suffixicon: isHobi ? Icons.add_circle : null,
                            suffixOnpress: () {
                              hobbiesListValueNoti.value
                                  .add(hobbiesController.text);
                              hobbiesControlValnoti.value.text = '';
                              ishobbiesValnoti.value = false;
                              highlightValuenotifier.value['hobbies'] =
                                  hobbiesListValueNoti.value;
                              highlightValuenotifier.notifyListeners();
                              hobbiesControlValnoti.notifyListeners();
                              hobbiesListValueNoti.notifyListeners();
                            },
                          ),
                        ),
                      ),
                      sizedBox5H,
                      ValueListenableBuilder(
                        valueListenable: hobbiesListValueNoti,
                        builder: (context, hobbiList, child) => hobbiList
                                .isNotEmpty
                            ? SizedBox(
                                height: 70,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: hobbiList.length,
                                    separatorBuilder: (context, index) =>
                                        sizedBox5W,
                                    padding: const EdgeInsets.all(10.0),
                                    itemBuilder: (context, index) => Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: colorApp,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    hobbiList[index],
                                                    style: const TextStyle(
                                                        color: colorWhite),
                                                  ),
                                                  sizedBox10W,
                                                  InkWell(
                                                    onTap: () {
                                                      hobbiesListValueNoti.value
                                                          .removeAt(index);
                                                      hobbiesListValueNoti
                                                          .notifyListeners();
                                                      if (hobbiesListValueNoti
                                                          .value.isEmpty) {
                                                        highlightValuenotifier
                                                            .value
                                                            .remove('hobbies');
                                                        highlightValuenotifier
                                                            .notifyListeners();
                                                      }
                                                    },
                                                    child: const Icon(
                                                        Icons.cancel,
                                                        color: colorWhite,
                                                        size: 18),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                              )
                            : const SizedBox(),
                      )
                    ],
                  ),
                ),
                sizedBox20H,
                HighlightContWidget(
                    title: 'Your Address ?',
                    content: 'Please Provide your Address',
                    widget: Column(
                      children: [
                        TextFormAreaWidget(
                          controller: addressController,
                          label: 'Address',
                          icon: Icons.contact_mail,
                          onChanged: (p0) {
                            addressChooseFN(addressController);
                          },
                        )
                      ],
                    )),
                sizedBox15H,
                SizedBox(
                  width: Get.width,
                  child: ElevatedBtnWidget(
                    onPressed: () {
                      addProfileTo();
                    },
                    btnColor: colorApp,
                    title: 'Add Your Profile'.toUpperCase(),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
