import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/ui/login_screen/view/reset_password_screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_functions.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../shared/material_button.dart';

class OtpScreen extends StatefulWidget {
  static const String routeName = "/OtpScreen";

  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  TextEditingController emailController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          disposeKeyboard();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bgWithContainerImage),
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
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back_ios_new),
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
                        const Text(
                          "Enter the OTP sent to Email!",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),
                        OTPTextField(
                          keyboardType: TextInputType.number,
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: 50,
                          otpFieldStyle: OtpFieldStyle(borderColor: Colors.red),
                          style: const TextStyle(fontSize: 17),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                          onCompleted: (pin) {
                            print("Completed: " + pin);
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
