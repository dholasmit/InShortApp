import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';
import 'package:inshorts_newj/shared/dilog_box.dart';
import 'package:inshorts_newj/ui/base_setting/view/profile_screen.dart';

import '../../../custem_class/constant/app_icons.dart';
import '../../../custem_class/constant/app_images.dart';
import '../controller/base_setting_controller.dart';
import 'notification_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  BaseSettingController baseSettingController =
      Get.find<BaseSettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bgWithContainerImage),
              fit: BoxFit.cover,
            ),
          ),
          child: GetBuilder(
            builder: (BaseSettingController baseSettingController) {
              return Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Image.asset(
                        AppImages.appLogo,
                        height: 22,
                        width: 60,
                      ),
                      const Spacer(),
                      const Text(
                        "Settings",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 21,
                          color: AppColors.blueColor,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.toNamed(ProfileScreen.routeName);
                        },
                        child: Image.asset(
                          AppIcons.profileIcons,
                          color: AppColors.blueColor,
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: baseSettingController.settingIcon.length,
                      itemBuilder: (BuildContext context, int index) {
                        return settingCommonSell(
                          onTap: () {
                            baseSettingController.selectedIndex = index;
                            index == 0
                                ? languageDialog()
                                : index == 1
                                    ? Get.toNamed(NotificationScreen.routeName)
                                    : index == 2
                                        ? nightModeDialog()
                                        : index == 3
                                            ? textSizeDialog()
                                            : index == 4
                                                ? baseSettingController.share()
                                                : index == 5
                                                    ? const SizedBox()
                                                    : index == 6
                                                        ? const SizedBox()
                                                        : index == 7
                                                            ? const SizedBox()
                                                            : index == 8
                                                                ? const SizedBox()
                                                                : index == 9
                                                                    ? logOut()
                                                                    : const SizedBox();
                          },
                          index: index,
                          ic: baseSettingController.settingIcon[index],
                          name: baseSettingController.settingName[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          )),
    );
  }

  settingCommonSell({
    required String ic,
    required String name,
    required int index,
    required void Function() onTap,
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 10),
            InkWell(
              onTap: onTap,
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: index == baseSettingController.selectedIndex
                        ? AppColors.blueColor
                        : Colors.transparent,
                  ),
                  color: AppColors.settingContainerColor,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    Image.asset(
                      ic,
                      height: 40,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      name,
                      style: const TextStyle(
                        color: AppColors.signupBTNColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  languageDialog() {
    return dialog(
      context,
      ic: AppIcons.languageIcons,
      title: "Language",
      txt1: "English",
      value1: baseSettingController.eng,
      groupValue1: baseSettingController.group,
      onChanged1: (val) {
        baseSettingController.group = baseSettingController.eng;
      },
      txt2: "Hindi",
      value2: baseSettingController.hindi,
      groupValue2: baseSettingController.group,
      onChanged2: (val) {
        baseSettingController.group = baseSettingController.hindi;
      },
      txt3: "Gujrati",
      value3: baseSettingController.guj,
      groupValue3: baseSettingController.group,
      onChanged3: (val) {
        baseSettingController.group = baseSettingController.guj;
      },
    );
  }

  nightModeDialog() {
    return dialog(
      context,
      ic: AppIcons.nightMOdeIcons,
      title: "Night Mode",
      txt1: "Light",
      value1: baseSettingController.light,
      groupValue1: baseSettingController.nightModeGroup,
      onChanged1: (val) {
        baseSettingController.nightModeGroup = baseSettingController.light;
      },
      txt2: "Dark",
      value2: baseSettingController.dark,
      groupValue2: baseSettingController.nightModeGroup,
      onChanged2: (val) {
        baseSettingController.nightModeGroup = baseSettingController.dark;
      },
      txt3: "System",
      value3: baseSettingController.system,
      groupValue3: baseSettingController.nightModeGroup,
      onChanged3: (val) {
        baseSettingController.nightModeGroup = baseSettingController.system;
      },
    );
  }

  textSizeDialog() {
    return dialog(
      context,
      ic: AppIcons.textSizeIcons,
      title: "Text Size",
      txt1: "Default",
      value1: baseSettingController.defaultText,
      groupValue1: baseSettingController.textSizeGroup,
      onChanged1: (val) {
        baseSettingController.textSizeGroup = baseSettingController.defaultText;
      },
      txt2: "Medium",
      value2: baseSettingController.medium,
      groupValue2: baseSettingController.textSizeGroup,
      onChanged2: (val) {
        baseSettingController.textSizeGroup = baseSettingController.medium;
      },
      txt3: "Large",
      value3: baseSettingController.large,
      groupValue3: baseSettingController.textSizeGroup,
      onChanged3: (val) {
        baseSettingController.textSizeGroup = baseSettingController.large;
      },
    );
  }

  logOut() {
    return logOutDialog(
      context,
      ic: AppIcons.logOutIcons,
      title: "Logout",
      onPressed: () {
        Get.back();
      },
    );
  }
}
