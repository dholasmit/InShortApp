import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_images.dart';
import 'package:inshorts_newj/ui/login_screen/view/welcome_screen.dart';

import '../../../custem_class/utils/local_storage.dart';
import '../../base_setting/controller/base_setting_controller.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BaseSettingController baseSettingController =
      Get.find<BaseSettingController>();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      Get.offAllNamed(WelComeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BaseSettingController>(
        id: "DarkLightMode",
        builder: (baseSettingController) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  LocalStorage.getLightDarkMode()
                      ? AppNightModeImage.splashScreenNightMode
                      : AppImages.splashScreenImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(
                  AppNightModeImage.appLogoNightMode,
                  // AppImages.appLogoBig,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
