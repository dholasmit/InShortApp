import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custem_class/utils/globle.dart';
import '../../../custem_class/utils/local_storage.dart';
import '../../../models/login_screen_model/user_model.dart';
import '../../../services/login_screen_repo/login_repo.dart';
import '../../../shared/laguage_option _screen.dart';

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

  CurrentUserModel? currentUserModel;

  Future userLogin() async {
    var response = await UserRepo.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    if (response != null) {
      currentUserModel = CurrentUserModel.fromJson(response);
      userController.userModel = currentUserModel!.data;
      LocalStorage.saveUserDetails();
      emailController.clear();
      passwordController.clear();
      checkValue = false;
      // Get.toNamed(BaseScreen.routeName);
      Get.toNamed(LanguageOptionScreen.routeName);
    }
  }
}
