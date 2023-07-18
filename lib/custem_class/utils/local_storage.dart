import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../models/login_screen_model/user_model.dart';
import 'globle.dart';

class LocalStorage {
  static final prefs = GetStorage();

  static saveUserDetails() {
    log("saveUserDetails ${userController.userModel!.toJson()}");

    prefs.write("LOGIN_USER_DATA", userController.userModel!.toJson());
    LocalStorage.setUserLogin();
  }

  static bool getUserDetails() {
    Map<String, dynamic>? userModel = prefs.read("LOGIN_USER_DATA");
    log("getUserDetails $userModel");
    if (userModel != null) {
      userController.userModel = UserModel.fromJson(userModel);
    }
    return userController.userModel == null ? false : true;
  }

  static setUserLogin() {
    prefs.write("IS_USER_LOGIN", true);
  }

  static bool isUserLogin() {
    return prefs.read("IS_USER_LOGIN") ?? false;
  }
}
