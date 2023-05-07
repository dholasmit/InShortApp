import 'dart:convert';
import 'dart:developer';

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
    // String? fcmToken,
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
          //    "fcmToken": fcmToken,
        },
      ),
    );
    log("dharmik     " + responseBody.toString());
    if (responseBody != null) {
      return responseBody;
    }
  }
}
