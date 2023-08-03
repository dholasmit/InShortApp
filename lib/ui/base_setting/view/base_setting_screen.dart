import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';
import 'package:inshorts_newj/shared/dilog_box.dart';
import 'package:inshorts_newj/ui/base_setting/view/profile_screen.dart';

import '../../../custem_class/constant/app_icons.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../custem_class/utils/local_storage.dart';
import '../../login_screen/view/login_screen.dart';
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
                  const SizedBox(height: 40),
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
                      const SizedBox(width: 25),
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

                            // baseSettingController.languageListData();
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
        context: context,
        ic: AppIcons.languageIcons,
        title: "Language",

        ///id 1 = English
        txt1: "${baseSettingController.getLanguageModel2!.data![0].name}",
        value1: baseSettingController.getEng,
        groupValue1: baseSettingController.getGroup,
        onChanged1: (val) {
          baseSettingController.setGroup = baseSettingController.getEng;
          baseSettingController.getLanguageModel2!.data![0].id.toString();
          Get.back();
        },

        ///id 2 = Guj

        txt2: "${baseSettingController.getLanguageModel2!.data![1].name}",
        value2: baseSettingController.getHindi,
        groupValue2: baseSettingController.getGroup,
        onChanged2: (val) {
          baseSettingController.setGroup = baseSettingController.getHindi;
          baseSettingController.getLanguageModel2!.data![1].id.toString();
          Get.back();
        },

        ///id 3 = Hindi

        txt3: "${baseSettingController.getLanguageModel2!.data![2].name}",
        value3: baseSettingController.getGuj,
        groupValue3: baseSettingController.getGroup,
        onChanged3: (val) {
          baseSettingController.setGroup = baseSettingController.getGuj;
          baseSettingController.getLanguageModel2!.data![2].id.toString();
          Get.back();
        });
  }

  nightModeDialog() {
    return dialog(
      context: context,
      ic: AppIcons.nightMOdeIcons,
      title: "Night Mode",
      txt1: "Light",
      value1: baseSettingController.light,
      groupValue1: baseSettingController.nightModeGroup,
      onChanged1: (val) {
        baseSettingController.nightModeGroup = baseSettingController.light;
        Get.back();

        /// Get.changeTheme(ThemeData.light());
      },
      txt2: "Dark",
      value2: baseSettingController.dark,
      groupValue2: baseSettingController.nightModeGroup,
      onChanged2: (val) {
        baseSettingController.nightModeGroup = baseSettingController.dark;
        Get.back();

        /// Get.changeTheme(ThemeData.dark());
      },
      txt3: "System",
      value3: baseSettingController.system,
      groupValue3: baseSettingController.nightModeGroup,
      onChanged3: (val) {
        baseSettingController.nightModeGroup = baseSettingController.system;
        Get.back();
      },
    );
  }

  textSizeDialog() {
    return dialog(
      context: context,
      ic: AppIcons.textSizeIcons,
      title: "Text Size",
      txt1: "Default",
      value1: baseSettingController.defaultText,
      groupValue1: baseSettingController.textSizeGroup,
      onChanged1: (val) {
        baseSettingController.textSizeGroup = baseSettingController.defaultText;
        Get.back();
      },
      txt2: "Medium",
      value2: baseSettingController.medium,
      groupValue2: baseSettingController.textSizeGroup,
      onChanged2: (val) {
        baseSettingController.textSizeGroup = baseSettingController.medium;
        Get.back();
      },
      txt3: "Large",
      value3: baseSettingController.large,
      groupValue3: baseSettingController.textSizeGroup,
      onChanged3: (val) {
        baseSettingController.textSizeGroup = baseSettingController.large;
        Get.back();
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
        LocalStorage.clearData();
        Get.offAllNamed(LoginScreen.routeName);
      },
    );
  }
}
