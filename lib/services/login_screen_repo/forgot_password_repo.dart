import 'dart:convert';

import '../api_handler.dart';
import '../api_routes.dart';

class ForGotPassWordRepo {
  static Future forgotPassWord({
    required String emailid,
    required String OldPassword,
    required String NewPassword,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.forGotPassWord,
      body: jsonEncode(
        {
          "emailid": emailid,
          "OldPassword": OldPassword,
          "NewPassword": NewPassword,
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
