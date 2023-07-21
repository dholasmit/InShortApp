import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../models/login_screen_model/signup_model.dart';
import '../../models/login_screen_model/user_model.dart';
import '../../models/setting_screen_model/langeuge_model_2.dart';
import 'globle.dart';

class LocalStorage {
  static final prefs = GetStorage();

  ////////////////////////////////////////////////////////////////////////////
  /// loginData Model Save
  ////////////////////////////////////////////////////////////////////////////

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

  ////////////////////////////////////////////////////////////////////////////
  /// signupData Model Save
  ////////////////////////////////////////////////////////////////////////////

  static saveSignUpDetails() {
    log("saveSignUpDetails ${userController.signUpData!.toJson()}");

    prefs.write("SIGNUP_USER_DATA", userController.signUpData!.toJson());
    LocalStorage.setUserSignUp();
  }

  static bool getSignUpDetails() {
    Map<String, dynamic>? signUpData = prefs.read("SIGNUP_USER_DATA");
    log("getSignUpDetails $signUpData");
    if (signUpData != null) {
      userController.signUpData = SignUpData.fromJson(signUpData);
    }
    return userController.signUpData == null ? false : true;
  }

  static setUserSignUp() {
    prefs.write("IS_USER_SIGNUP", true);
  }

  static bool isUserSignUp() {
    return prefs.read("IS_USER_SIGNUP") ?? false;
  }

  ////////////////////////////////////////////////////////////////////////////
  /// language Model  ///
  ////////////////////////////////////////////////////////////////////////////

  static saveLanguage() {
    log("saveUserDetails ${userController.languageModel2!.toJson()}");

    prefs.write("LOGIN_USER_DATA", userController.languageModel2!.toJson());
    LocalStorage.setUserLogin();
  }

  static bool getLanguage() {
    Map<String, dynamic>? languageModel2 = prefs.read("LOGIN_USER_DATA");
    log("getUserDetails $languageModel2");
    if (languageModel2 != null) {
      userController.languageModel2 = LanguageModel2.fromJson(languageModel2);
    }
    return userController.userModel == null ? false : true;
  }

  static setLanguage() {
    prefs.write("LANGUAGE", true);
  }

  static bool isLanguage() {
    return prefs.read("LANGUAGE") ?? false;
  }

////////////////////////////////////////////////////////////////////////////
  /// Choose Language Screen  ///
////////////////////////////////////////////////////////////////////////////
  static saveChooseLanguageScreen() {
    prefs.write("CHOOSE_LANGUAGE", true);
  }

  static bool getChooseLanguageScreen() {
    return prefs.read("CHOOSE_LANGUAGE") ?? false;
  }
}
