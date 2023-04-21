import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/setting_screen_model/language_model.dart';
import '../../../shared/bottam_seet.dart';
import '../controller/setting_controller.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "/SettingScreen";

  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingController settingController = Get.find<SettingController>();

  /// LanguageModel? languageModel;

  @override
  void initState() {
    // languageListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        centerTitle: true,
        title: const Text(
          "Setting",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              openBottomSheet(
                  title1: "Do you want to logout?",
                  title2: "Log Out",
                  onTap1: () {
                    Get.back();
                  },
                  onTap2: () {
                    Get.back();
                  });
            },
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: GetBuilder(
        builder: (SettingController settingController) {
          return Column(
            children: [
              // settingSell(
              //   icon: Icons.notifications,
              //   text: "Notification",
              //   onTap: () {},
              //   value: settingController.languageBtn,
              //   onChanged: (value) {
              //     settingController.languageBtn = value;
              //   },
              // ),
              settingSell(
                icon: settingController.nightModeBtn == true
                    ? Icons.nightlight
                    : Icons.mode_night_outlined,
                text: "NightMode",
                onTap: () {},
                value: settingController.nightModeBtn,
                onChanged: (value) {
                  setState(() {
                    settingController.nightModeBtn = value;
                    Get.isDarkMode
                        ? Get.changeTheme(ThemeData.light())
                        : Get.changeTheme(ThemeData.dark());
                  });
                },
              ),
              settingSell(
                icon: Icons.image_rounded,
                text: "HD Images",
                onTap: () {},
                value: settingController.hdImageBtn,
                onChanged: (value) {
                  settingController.hdImageBtn = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: languageField(),
              ),
            ],
          );
        },
      ),
    );
  }

  settingSell({
    required IconData icon,
    required String text,
    required void Function() onTap,
    required bool value,
    required void Function(bool)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Icon(
                      icon,
                      size: 25,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      text.tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      value: value,
                      onChanged: onChanged,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  languageField() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GetBuilder<SettingController>(
        id: "Languages",
        builder: (controller) => controller.languageModel != null
            ? Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: DropdownButton(
                  isExpanded: true,
                  focusColor: Colors.white,
                  underline: const Divider(color: Colors.transparent),
                  value: settingController.chosenValue,
                  style: const TextStyle(color: Colors.white),

                  /// iconEnabledColor: Colors.black,

                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                    ),
                  ),

                  items: settingController.languageModel!.languages
                      .map<DropdownMenuItem<String>>((Language value) {
                    return DropdownMenuItem(
                      value: value.name,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          value.name,
                          style: TextStyle(
                            color: settingController.nightModeBtn == true
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      settingController.chosenValue = value.toString();
                    });
                  },
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
