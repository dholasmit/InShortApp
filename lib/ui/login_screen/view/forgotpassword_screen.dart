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
import 'otp_screen.dart';

class ForGotPasswordScreen extends StatefulWidget {
  static const String routeName = "/ForGotPasswordScreen";

  const ForGotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForGotPasswordScreen> createState() => _ForGotPasswordScreenState();
}

class _ForGotPasswordScreenState extends State<ForGotPasswordScreen> {
  BaseSettingController baseSettingController =
      Get.find<BaseSettingController>();
  ForgotPasswordController forgotPasswordController =
      Get.find<ForgotPasswordController>();

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
                      key: forgotPasswordController.forgotFormKey,
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
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Forgot Password ?",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: AppColors.blueColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "Don’t worry! it happens. Please enter the address associated with your account.",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: LocalStorage.getLightDarkMode()
                                          ? AppNightModeColor.white
                                          : AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 70),
                                  const Text(
                                    "Email ID:",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.signupBTNColor,
                                    ),
                                  ),
                                  RequestFormTextfield(
                                    formFieldType: RequestFormFieldType
                                        .emailIdForgotPassword,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    controller: forgotPasswordController
                                        .emailController,
                                    validator: (val) =>
                                        validateEmail(val?.trim()),
                                  ),
                                  const SizedBox(height: 200),
                                  submitBtn(),
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

  submitBtn() {
    return materialButton(
      onTap: () {
        disposeKeyboard();

        /// remove this line after API
        Get.toNamed(OtpScreen.routeName);

        ///
        if (forgotPasswordController.forgotFormKey.currentState!.validate()) {
          Get.back();
        }
      },
      color: AppColors.blueColor,
      btnText: "Submit",
    );
  }
}
