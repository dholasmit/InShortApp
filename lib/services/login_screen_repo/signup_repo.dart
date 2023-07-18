import 'dart:convert';
import 'dart:io';

import '../api_handler.dart';
import '../api_routes.dart';

class SignUpRepo {
  static Future signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.signUp,
      body: jsonEncode(
        {
          "EmailId": email,
          "Password": password,
          "FirstName": firstName,
          "LastName": lastName,
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
