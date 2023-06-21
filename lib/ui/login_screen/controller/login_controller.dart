import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/login_screen_model/login_model.dart';
import '../../../services/login_screen_repo/signup_repo.dart';
import '../../base_screen/view/base_screen.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// late LoginModel loginModel;
  bool _checkValue = false;

  bool get checkValue => _checkValue;

  set checkValue(bool value) {
    _checkValue = value;
    update();
  }

  LoginModel? _loginModel;

  LoginModel? get loginModel => _loginModel;

  set loginModel(LoginModel? value) {
    _loginModel = value;
    update();
  }

  Future loginFlow() async {
    Map<String, dynamic> body = {
      "Email": emailController.text.trim(),
      "Password": passwordController.text.trim(),
    };
    loginModel = await LoginApi.loginUser(body);
    //  print(loginModel!.message);
    Get.toNamed(BaseScreen.routeName);
  }

// Future userLogin() async {
//   var response = await LoginRepo.login(
//     email: emailController.text.trim(),
//     password: passwordController.text.trim(),
//   );
//   if (response != null) {
//     loginModel = LoginModel.fromJson(response);
//     Get.toNamed(BaseScreen.routeName);
//     emailController.clear();
//     passwordController.clear();
//   }
// }
}
