import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';
import 'package:inshorts_newj/shared/dilog_box.dart';
import 'package:inshorts_newj/ui/base_setting/view/profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../custem_class/constant/app_icons.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../custem_class/utils/local_storage.dart';
import '../../login_screen/view/login_screen.dart';
import '../controller/base_setting_controller.dart';
import 'common/dialog.dart';

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
      body: GetBuilder<BaseSettingController>(
        id: "DarkLightMode",
        builder: (baseSettingController) {
          return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    LocalStorage.getLightDarkMode()
                        ? AppNightModeImage.bgWithContainerImageNightMode
                        : AppImages.bgWithContainerImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: GetBuilder(
                id: "language",
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
                                baseSettingController.chooseLanguage =
                                    LocalStorage.getLanguageType();
                                baseSettingController.setIsNightMode =
                                    LocalStorage.getLightDarkMode();
                                baseSettingController.chooseModeList =
                                    LocalStorage.intGetLightDarkMode();
                                baseSettingController.chooseFontSize =
                                    LocalStorage.getFontSize();

                                // baseSettingController.chooseLanguage =
                                //     LocalStorage.getLightDarkMode();
                                index == 0
                                    ? languageDialog(context)
                                    : index == 1
                                        // ? Get.toNamed(NotificationScreen.routeName)
                                        ? const SizedBox()
                                        : index == 2
                                            ? nightModeDialog(context)
                                            : index == 3
                                                ? textSizeDialog(context)
                                                : index == 4
                                                    ? baseSettingController
                                                        .share()
                                                    : index == 5
                                                        ? const SizedBox()
                                                        : index == 6
                                                            ? const SizedBox()
                                                            : index == 7

                                                                /// open in google chrome web
                                                                ? termsCondition()
                                                                : index == 8
                                                                    ? privacyPolicy()
                                                                    : index == 9
                                                                        ? logOut()
                                                                        : const SizedBox();
                              },
                              index: index,
                              ic: baseSettingController.settingIcon[index],
                              name: LocalStorage.getLanguageType() == 1
                                  ? baseSettingController
                                      .settingNameEnglish[index]
                                  : LocalStorage.getLanguageType() == 2
                                      ? baseSettingController
                                          .settingNameGujarati[index]
                                      : LocalStorage.getLanguageType() == 3
                                          ? baseSettingController
                                              .settingNameHindi[index]
                                          : "",
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ));
        },
      ),
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
        child: GetBuilder(
          id: "FontSize",
          builder: (BaseSettingController baseSettingController) {
            return Column(
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
                      color: LocalStorage.getLightDarkMode()
                          ? AppNightModeColor.exploreTopicListColor
                          : AppColors.settingContainerColor,
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
                          style: TextStyle(
                            color: AppColors.signupBTNColor,
                            fontWeight: FontWeight.w600,
                            fontSize: baseSettingController.fontsStyle(
                              defaultSize: 15,
                              mediumSize: 18,
                              largeSize: 21,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  termsCondition() {
    return launchUrl(Uri.parse(baseSettingController.termsCondition));
  }

  privacyPolicy() {
    return launchUrl(Uri.parse(baseSettingController.privacyPolicy));
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
