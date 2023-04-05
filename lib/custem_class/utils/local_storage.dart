import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  static saveData(String key, dynamic value) async {
    final prefs = await getSharedPreferences();
    await prefs.setString(key, jsonEncode(value));
    await prefs.reload();
  }

  static Future<dynamic> getData(String key) async {
    final prefs = await getSharedPreferences();
    var value = prefs.getString(key);
    return json.decode(value!);
  }
}
// import 'dart:developer';
//
// class LocalStorage {
//   static final prefs = GetStorage();
//
//   static saveOnBoarding() {
//     prefs.write("ONBOARDING", true);
//   }
//
//   static bool getOnBoarding() {
//     return prefs.read("ONBOARDING") ?? false;
//   }
//
//   static saveUserDetails() {
//     log("saveUserDetails ${userController.userModel!.toJson()}");
//
//     prefs.write("LOGIN_USER_DATA", userController.userModel!.toJson());
//     LocalStorage.setUserLogin();
//   }
//
//   static bool getUserDetails() {
//     Map<String, dynamic>? userModel = prefs.read("LOGIN_USER_DATA");
//     log("getUserDetails $userModel");
//     if (userModel != null) {
//       userController.userModel = UserModel.fromJson(userModel);
//     }
//     return userController.userModel == null ? false : true;
//   }
//
//   static setUserLogin() {
//     prefs.write("IS_USER_LOGIN", true);
//   }
//
//   static bool isUserLogin() {
//     return prefs.read("IS_USER_LOGIN") ?? false;
//   }
//
//   static setFCMToken(String value) {
//     prefs.write("USER_FCM_TOKEN", value);
//   }
//
//   static String getFCMToken() {
//     return prefs.read("USER_FCM_TOKEN") ?? "";
//   }
//
//   static setFilter(int value) {
//     prefs.write("filter", value);
//   }
//
//   static int getFilter() {
//     return prefs.read("filter") ?? 0;
//   }
//
//   // saveUserDetails(UserModel data) {
//   //   userController?.userModel!.user = data.user;
//   //   userController?.userModel!.accessToken = data.accessToken;
//   //   sharedPreference.write("GreboUser", data.user.toJson());
//   //   sharedPreference.write("UserToken", data.accessToken);
//   //   sharedPreference.write("isUserLogin", true);
//   // }
//
//   static clearData() {
//     // prefs.remove("USER_FCM_TOKEN");
//     prefs.remove("LOGIN_USER_DATA");
//     prefs.remove("IS_USER_LOGIN");
//   }
// }
//
// final sharedPreference = GetStorage();
