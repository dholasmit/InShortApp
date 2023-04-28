import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/services/login_screen_repo/login_repo.dart';

import '../../news_screen/view/news_screen.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _checkValue = false;

  bool get checkValue => _checkValue;

  set checkValue(bool value) {
    _checkValue = value;
    update();
  }

  Future userLogin() async {
    var response = await LoginRepo.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    if (response != null) {
      Get.toNamed(NewsScreen.routeName);
      emailController.clear();
      passwordController.clear();
    }
  }
}
