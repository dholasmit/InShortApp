import 'dart:convert';

import '../api_handler.dart';
import '../api_routes.dart';

class SignUpRepo {
  static Future signup({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required bool newsletter,
    required bool acceptPrivacyPolicyPopup,
    String? fcmToken,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.signUp,
      body: jsonEncode(
        {
          "userName": userName,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "newsletter": newsletter,
          "acceptPrivacyPolicyPopup": acceptPrivacyPolicyPopup,
          "fcmToken": fcmToken,
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
