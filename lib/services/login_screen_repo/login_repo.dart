import 'dart:convert';
import 'dart:io';

import '../api_handler.dart';
import '../api_routes.dart';

class UserRepo {
  static Future login({
    required String email,
    required String password,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.login,
      body: jsonEncode(
        {
          "Email": email,
          "Password": password,
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
