import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/login_screen_repo/signup_repo.dart';

class SignUpController extends GetxController {
  final signFormKey = GlobalKey<FormState>();
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
    update();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future userSignUp() async {
    return await SignUpRepo.signUp(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
    );
  }

  userDataLogin() async {
    Map<String, dynamic>? response = await userSignUp();
    if (response != null) {
      Get.back();
    }
  }
}
