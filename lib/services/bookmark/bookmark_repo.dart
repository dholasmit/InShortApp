import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:inshorts_newj/custem_class/utils/globle.dart';

import '../../models/bookmark/bookmark_model.dart';
import '../api_routes.dart';
import '../http_service.dart';

class BookmarkApi {
  static Future bookmarkList() async {
    try {
      String customerID = userController.userModel?.customerGuid ?? "";
      print(customerID);
      String url = "${APIRoutes.bookMarkList}$customerID&languageId=1";

      http.Response? response = await HttpService.getApi(
        url: url,
        header: {'Content-Type': 'application/json'},
      );
      if (response != null && response.statusCode == 200) {
        print(
            "RESPONSE BODY================================> ${response.body}");
        return bookMarkModelFromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
