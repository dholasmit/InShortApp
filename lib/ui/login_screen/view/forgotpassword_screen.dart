import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_functions.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../shared/textfild_common.dart';
import '../controller/forgotpassword_controller.dart';

class ForGotPasswordScreen extends StatefulWidget {
  static const String routeName = "/ForGotPasswordScreen";

  const ForGotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForGotPasswordScreen> createState() => _ForGotPasswordScreenState();
}

class _ForGotPasswordScreenState extends State<ForGotPasswordScreen> {
  ForgotPasswordController forgotPasswordController =
      Get.find<ForgotPasswordController>();

  @override
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
            child: GetBuilder(
              builder: (ForgotPasswordController forgotPasswordController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
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
                    const Text(
                      "Don’t worry! it happens. Please enter the address associated with your account.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Email ID:",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.signupBTNColor,
                      ),
                    ),
                    RequestFormTextfield(
                      formFieldType: RequestFormFieldType.emailIdForgotPassword,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      controller: forgotPasswordController.emailController,
                      validator: (val) => validateEmail(val?.trim()),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
