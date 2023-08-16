import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_functions.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../custem_class/utils/local_storage.dart';
import '../../../shared/material_button.dart';
import '../../../shared/textfild_common.dart';
import '../../base_setting/controller/base_setting_controller.dart';
import '../controller/forgotpassword_controller.dart';
import 'congress_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = "/ResetPasswordScreen";

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ForgotPasswordController forgotPasswordController =
      Get.find<ForgotPasswordController>();
  BaseSettingController baseSettingController =
      Get.find<BaseSettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          disposeKeyboard();
        },
        child: GetBuilder<BaseSettingController>(
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
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 25,
                  right: 25,
                  bottom: 10,
                ),
                child: GetBuilder(
                  builder: (ForgotPasswordController forgotPasswordController) {
                    return Form(
                      key: forgotPasswordController.resetPasswordFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: LocalStorage.getLightDarkMode()
                                  ? AppNightModeColor.white
                                  : AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Reset",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: AppColors.blueColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Text(
                                    "Password",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: AppColors.blueColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "Enter the Your New Password!",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: LocalStorage.getLightDarkMode()
                                          ? AppNightModeColor.white
                                          : AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  header(title: "New Password"),
                                  const SizedBox(height: 5),
                                  RequestFormTextfield(
                                    formFieldType:
                                        RequestFormFieldType.newPassword,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    controller: forgotPasswordController
                                        .newPasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Your Password';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 25),
                                  header(title: "Confirm new password"),
                                  const SizedBox(height: 5),
                                  RequestFormTextfield(
                                    formFieldType:
                                        RequestFormFieldType.confirmNewPassword,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.done,
                                    controller: forgotPasswordController
                                        .newConfirmPasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Your Password';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 200),
                                  signUpBtnReset(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  signUpBtnReset() {
    return materialButton(
      onTap: () {
        disposeKeyboard();

        /// remove this line after API
        Get.toNamed(CongressScreen.routeName);

        ///
        // if (forgotPasswordController.resetPasswordFormKey.currentState!
        //     .validate()) {
        //   Get.back();
        // }
      },
      color: AppColors.blueColor,
      btnText: "Submit",
    );
  }

  header({required String title}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: LocalStorage.getLightDarkMode()
                ? AppNightModeColor.white
                : AppColors.black,
          ),
        ),
        const Text(
          "*",
          style: TextStyle(
            color: Colors.red,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
