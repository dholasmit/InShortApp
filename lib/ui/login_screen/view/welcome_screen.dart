import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_images.dart';
import 'package:inshorts_newj/custem_class/utils/local_storage.dart';
import 'package:inshorts_newj/ui/login_screen/view/login_screen.dart';
import 'package:inshorts_newj/ui/login_screen/view/signup_screen.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../shared/material_button.dart';

class WelComeScreen extends StatelessWidget {
  static const String routeName = "/WelComeScreen";

  const WelComeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalStorage.saveWelComeScreen();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bgWithContainerImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            const Spacer(),
            Image.asset(AppImages.appLogo),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.welcomeContainer),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(AppImages.dividerImage),
                    const SizedBox(height: 40),
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blueColor,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        textAlign: TextAlign.center,
                        "This App is free to use. Find here the Best Data Package for your stay in Wonderful  INshorts.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const SizedBox(width: 25),
                        Expanded(
                          child: materialBorderButton(
                            context,
                            onPressed: () {
                              Get.toNamed(LoginScreen.routeName);
                            },
                            txt: "Sign in",
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: materialButton(
                            onTap: () {
                              Get.toNamed(SignUpScreen.routeName);
                            },
                            color: AppColors.signupBTNColor,
                            btnText: "Sign up",
                          ),
                        ),
                        const SizedBox(width: 25),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
