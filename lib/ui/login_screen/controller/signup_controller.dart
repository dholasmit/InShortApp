import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/login_screen_model/signup_model.dart';
import '../../../services/login_screen_repo/signup_repo.dart';

class SignUpController extends GetxController {
  final signFormKey = GlobalKey<FormState>();
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
    update();
  }

  SingnUpModel? _singnUpModel;

  SingnUpModel? get singnUpModel => _singnUpModel;

  set singnUpModel(SingnUpModel? value) {
    _singnUpModel = value;
    update();
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future userSignUp() async {
    return await SignUpRepo.signup(
      userName: singnUpModel?.firstName ?? "",
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
      newsletter: singnUpModel?.newsletter ?? false,
      acceptPrivacyPolicyPopup: singnUpModel?.acceptPrivacyPolicyPopup ?? false,
    );
  }
}
// fcmToken: LocalStorage.getFCMToken(),
