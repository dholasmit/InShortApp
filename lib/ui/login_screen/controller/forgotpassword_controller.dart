import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/ui/login_screen/view/congress_screen.dart';

import '../../../models/login_screen_model/forgot_password_model.dart';
import '../../../services/login_screen_repo/forgot_password_repo.dart';

class ForgotPasswordController extends GetxController {
  final forgotFormKey = GlobalKey<FormState>();
  final resetPasswordFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  ForgotPasswordModel? forgotPasswordModel;

  Future forGotPassData() async {
    var response = await ForGotPassWordRepo.forgotPassWord(
      emailId: emailController.text.trim(),
      oldPassword: oldPasswordController.text.trim(),
      newPassword: newPasswordController.text.trim(),
    );
    if (response != null) {
      forgotPasswordModel = ForgotPasswordModel.fromJson(response);
      emailController.clear();
      oldPasswordController.clear();
      newPasswordController.clear();
      Get.toNamed(CongressScreen.routeName);
    }
  }
}
