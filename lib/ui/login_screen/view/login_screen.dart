import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_images.dart';
import 'package:inshorts_newj/ui/login_screen/controller/login_controller.dart';
import 'package:inshorts_newj/ui/login_screen/view/signup_screen.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_settings.dart';
import '../../../shared/material_button.dart';
import '../../../shared/textfild_common.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/LoginScreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(SignUpScreen.routeName);
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GetBuilder(
                  builder: (LoginController loginController) {
                    return Form(
                      key: loginController.loginFormKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "SIgn In",
                              style: TextStyle(
                                color: AppColors.blueColor,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Start Your Journey With Us. And Enjoy This Wonderful App.",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: Image.asset(AppImages.loginScreenAvatar),
                            ),
                            const SizedBox(height: 25),
                            RequestFormTextfield(
                              formFieldType: RequestFormFieldType.email,
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.next,
                              controller: loginController.emailController,
                              validator: (val) => validateEmail(val?.trim()),
                            ),
                            const SizedBox(height: 15),
                            RequestFormTextfield(
                              formFieldType: RequestFormFieldType.password,
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.done,
                              controller: loginController.passwordController,
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
                                    value: loginController.checkValue,
                                    onChanged: (bool? value) {
                                      loginController.checkValue = value!;
                                    }),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    "Forget password ?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            materialButton(
                              onTap: () {},
                              color: AppColors.blueColor,
                              btnText: "Sign in",
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                Expanded(
                                  child: Divider(
                                    thickness: 2,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "OR",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Divider(
                                    thickness: 2,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: iconTextMaterialButton(
                                    btnText: "Google",
                                    color: AppColors.signupBTNColor,
                                    img: AppImages.googleIcon,
                                    onTap: () {},
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: iconTextMaterialButton(
                                    btnText: "Apple ID",
                                    color: AppColors.signupBTNColor,
                                    img: AppImages.appleIcon,
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Spacer(),
                                RichText(
                                  text: TextSpan(
                                    text: "don’t have an account ?".tr,
                                    style: const TextStyle(
                                      fontFamily: kAppFont,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: " Sign Up ".tr,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.toNamed(SignUpScreen.routeName);
                                          },
                                        style: const TextStyle(
                                          fontFamily: kAppFont,
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
