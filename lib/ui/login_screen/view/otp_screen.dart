import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/ui/login_screen/view/reset_password_screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_functions.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../custem_class/utils/local_storage.dart';
import '../../../shared/material_button.dart';
import '../../base_setting/controller/base_setting_controller.dart';

class OtpScreen extends StatefulWidget {
  static const String routeName = "/OtpScreen";

  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController emailController = TextEditingController();
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
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              "OTP ",
                              maxLines: 2,
                              style: TextStyle(
                                color: AppColors.blueColor,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Text(
                              "Verification!",
                              maxLines: 2,
                              style: TextStyle(
                                color: AppColors.blueColor,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Enter the OTP sent to Email!",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: LocalStorage.getLightDarkMode()
                                    ? AppNightModeColor.white
                                    : AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 40),
                            OTPTextField(
                              keyboardType: TextInputType.number,
                              length: 4,
                              width: MediaQuery.of(context).size.width,
                              fieldWidth: 50,
                              otpFieldStyle:
                                  OtpFieldStyle(borderColor: Colors.red),
                              style: TextStyle(
                                fontSize: 17,
                                color: LocalStorage.getLightDarkMode()
                                    ? AppNightModeColor.white
                                    : AppColors.black,
                              ),
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldStyle: FieldStyle.box,
                              onCompleted: (pin) {
                                debugPrint("Completed: $pin");
                              },
                            ),
                            const SizedBox(height: 250),
                            signUpBtnOtp(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  signUpBtnOtp() {
    return materialButton(
      onTap: () {
        disposeKeyboard();

        /// remove this line after API
        Get.toNamed(ResetPasswordScreen.routeName);

        ///
        // if (signUpController.signFormKey.currentState!.validate()) {
        //   Get.back();
        // }
      },
      color: AppColors.blueColor,
      btnText: "Submit",
    );
  }
}
