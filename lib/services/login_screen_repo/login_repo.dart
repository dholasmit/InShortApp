import 'dart:convert';
import 'dart:io';

import '../api_handler.dart';
import '../api_routes.dart';

class LoginRepo {
  static Future login({
    required String email,
    required String password,
//    String? fcmToken,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.login,
      body: jsonEncode(
        {
          "email": email,
          "password": password,
          //   "fcmToken": fcmToken,
          "device": Platform.isAndroid ? "android" : "ios",
        },
      ),
    );
    if (responseBody != null) {
      return responseBody;
    } else {
      return null;
    }
  }
}
