import 'dart:convert';

import '../api_handler.dart';
import '../api_routes.dart';

class ForGotPassWordRepo {
  static Future forgotPassWord({
    required String emailId,
    required String oldPassword,
    required String newPassword,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.forGotPassWord,
      body: jsonEncode(
        {
          "emailid": emailId,
          "OldPassword": oldPassword,
          "NewPassword": newPassword,
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
