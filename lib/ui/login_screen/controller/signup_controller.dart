import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/utils/globle.dart';

import '../../../custem_class/utils/local_storage.dart';
import '../../../models/login_screen_model/user_model.dart';
import '../../../services/login_screen_repo/signup_repo.dart';
import '../../../shared/laguage_option_screen.dart';

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

  /// SignUpModel? signUpModel;
  CurrentUserModel? currentUserModel;

  Future userSignUp() async {
    Map<String, dynamic>? response = await SignUpRepo.signUp(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
    );
    currentUserModel = CurrentUserModel.fromJson(response!);

    /// signUpModel = SignUpModel.fromJson(response!);
    userController.userModel = currentUserModel!.data;

    /// userController.signUpData = signUpModel!.data;
    //LocalStorage.saveSignUpDetails();
    LocalStorage.saveUserDetails();
    // Get.toNamed(BaseScreen.routeName);
    Get.toNamed(LanguageOptionScreen.routeName);
  }
// Future userSignUp() async {
//   return await SignUpRepo.signUp(
//     email: emailController.text.trim(),
//     password: passwordController.text.trim(),
//     firstName: firstNameController.text.trim(),
//     lastName: lastNameController.text.trim(),
//   );
// }
  ///
// userDataLogin() async {
//   Map<String, dynamic>? response = await userSignUp();
//   if (response != null) {
//     Get.back();
//   }
// }
}
