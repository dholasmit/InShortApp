import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_functions.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../shared/material_button.dart';
import '../../../shared/textfild_common.dart';
import '../controller/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/SignUpScreen";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          disposeKeyboard();
        },
        child: Container(
          height: double.infinity,
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
              builder: (SignUpController signUpController) {
                return Form(
                  key: signUpController.signFormKey,
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
                                "Sign Up",
                                style: TextStyle(
                                  color: AppColors.blueColor,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Sign up to get started!",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 100),
                              RequestFormTextfield(
                                formFieldType: RequestFormFieldType.userName,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                controller: signUpController.userNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Your UserName';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              RequestFormTextfield(
                                formFieldType: RequestFormFieldType.email,
                                textCapitalization: TextCapitalization.none,
                                textInputAction: TextInputAction.next,
                                controller: signUpController.emailController,
                                validator: (val) => validateEmail(val?.trim()),
                              ),
                              const SizedBox(height: 15),
                              RequestFormTextfield(
                                formFieldType: RequestFormFieldType.password,
                                textCapitalization: TextCapitalization.none,
                                textInputAction: TextInputAction.next,
                                controller: signUpController.passwordController,
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
                                controller:
                                    signUpController.confirmPasswordController,
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
                                      onChanged: (bool? value) {
                                        signUpController.isChecked = value!;
                                      }),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "I agree to ".tr,
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Terms & Agreement".tr,
                                            recognizer: TapGestureRecognizer()
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
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                              )),
                                          TextSpan(
                                            text: "Privacy Policy".tr,
                                            recognizer: TapGestureRecognizer()
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
                                      style: const TextStyle(
                                        //  fontFamily: kAppFont,
                                        fontSize: 14,
                                        color: Colors.black,
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
            Map<String, dynamic>? response =
                await signUpController.userSignUp();
            log(response.toString());
            if (response != null) {
              Get.back();
            }
          }
        }
      },
      color: AppColors.blueColor,
      btnText: "Sign Up",
    );
  }
}
//signUpController.userSignUp();

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  @override
  BorderSide? resolve(_) =>
      const BorderSide(color: AppColors.signupBTNColor, width: 1.3);
}
