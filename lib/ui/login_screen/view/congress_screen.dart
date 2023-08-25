import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_functions.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../custem_class/utils/local_storage.dart';
import '../../../shared/material_button.dart';
import '../../base_setting/controller/base_setting_controller.dart';
import 'login_screen.dart';

class CongressScreen extends StatefulWidget {
  static const String routeName = "/CongressScreen";

  const CongressScreen({Key? key}) : super(key: key);

  @override
  State<CongressScreen> createState() => _CongressScreenState();
}

class _CongressScreenState extends State<CongressScreen> {
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
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Image.asset(AppImages.appLogoBig),
                ),
                const SizedBox(height: 10),
                Text(
                  "Congratulations!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: LocalStorage.getLightDarkMode()
                        ? AppNightModeColor.white
                        : AppColors.black,
                  ),
                ),
                const Text(
                  "Your account is ready to use",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.signupBTNColor,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: gotoHomepage(),
                ),
                const SizedBox(height: 150),
              ],
            ),
          );
        },
      ),
    );
  }

  gotoHomepage() {
    return materialButton(
      onTap: () {
        disposeKeyboard();
        Get.toNamed(LoginScreen.routeName);
      },
      color: AppColors.blueColor,
      btnText: "Go to Homepage",
    );
  }
}
