import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_functions.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../shared/material_button.dart';
import '../../../shared/textfild_common.dart';
import '../../base_setting/controller/base_setting_controller.dart';
import '../controller/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/SignUpScreen";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.find<SignUpController>();
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    baseSettingController.isNightMode
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
                  builder: (SignUpController signUpController) {
                    return Form(
                      key: signUpController.signFormKey,
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
                              color: baseSettingController.isNightMode
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
                                    "Sign Up",
                                    style: TextStyle(
                                      color: AppColors.blueColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Sign up to get started!",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: baseSettingController.isNightMode
                                          ? AppNightModeColor.white
                                          : AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 100),
                                  RequestFormTextfield(
                                    formFieldType:
                                        RequestFormFieldType.firstName,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        signUpController.firstNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Your FirstName';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 15),
                                  RequestFormTextfield(
                                    formFieldType:
                                        RequestFormFieldType.lastName,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        signUpController.lastNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Your LastName';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 15),
                                  RequestFormTextfield(
                                    formFieldType: RequestFormFieldType.email,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        signUpController.emailController,
                                    validator: (val) =>
                                        validateEmail(val?.trim()),
                                  ),
                                  const SizedBox(height: 15),
                                  RequestFormTextfield(
                                    formFieldType:
                                        RequestFormFieldType.password,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        signUpController.passwordController,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Your Password';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 15),
                                  RequestFormTextfield(
                                    formFieldType:
                                        RequestFormFieldType.confirmPassword,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.done,
                                    controller: signUpController
                                        .confirmPasswordController,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Your Password';
                                      }
                                      return null;
                                    },
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: signUpController.isChecked,
                                          side: BorderSide(
                                            color: baseSettingController
                                                    .isNightMode
                                                ? AppNightModeColor.white
                                                : AppColors.black,
                                          ),
                                          onChanged: (bool? value) {
                                            signUpController.isChecked = value!;
                                          }),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            text: "I agree to ".tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: baseSettingController
                                                      .isNightMode
                                                  ? AppNightModeColor.white
                                                  : AppColors.black,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: "Terms & Agreement".tr,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        // var url = aboutScreenController
                                                        //     .appDetailDataModel!
                                                        //     .termsAndConditions;
                                                        // if (await canLaunch(url)) {
                                                        //   await launch(url);
                                                        // } else {
                                                        //   throw "Failed to open LinkedIn";
                                                        // }
                                                      },
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: AppColors.blueColor,
                                                ),
                                              ),
                                              TextSpan(
                                                  text: " and ".tr,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: baseSettingController
                                                            .isNightMode
                                                        ? AppNightModeColor
                                                            .white
                                                        : AppColors.black,
                                                  )),
                                              TextSpan(
                                                text: "Privacy Policy".tr,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        // var url = aboutScreenController
                                                        //     .appDetailDataModel!
                                                        //     .privacyPolicy;
                                                        // if (await canLaunch(url)) {
                                                        //   await launch(url);
                                                        // } else {
                                                        //   throw "Failed to open LinkedIn";
                                                        // }
                                                      },
                                                style: const TextStyle(
                                                  height: 1.2,
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: AppColors.blueColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 60),
                                  signUpBtn(),
                                  const SizedBox(height: 60),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          text: "Already have an account ?".tr,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: baseSettingController
                                                    .isNightMode
                                                ? AppNightModeColor.white
                                                : AppColors.black,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: " Sign In ".tr,
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Get.back();
                                                },
                                              style: const TextStyle(
                                                //   fontFamily: kAppFont,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.blueColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
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

  signUpBtn() {
    return materialButton(
      onTap: () async {
        disposeKeyboard();
        if (signUpController.signFormKey.currentState!.validate()) {
          if (!signUpController.isChecked) {
            flutterToast("Please agree Terms and conditions");
          } else {
            signUpController.userSignUp();
          }
          //   Map<String, dynamic>? response =
          //       await signUpController.userSignUp();
          //   if (response != null) {
          //     Get.back();
          //   }
          // }
        }
      },
      color: AppColors.blueColor,
      btnText: "Sign Up",
    );
  }
}

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  @override
  BorderSide? resolve(_) =>
      const BorderSide(color: AppColors.signupBTNColor, width: 1.3);
}
