import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:inshorts_newj/custem_class/utils/globle.dart';

import '../../custem_class/utils/local_storage.dart';
import '../../models/bookmark/addbookmark_model.dart';
import '../../models/bookmark/bookmark_model.dart';
import '../../models/bookmark/remove_bookmark_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';
import '../http_service.dart';

class BookmarkApi {
  static Future bookmarkList() async {
    try {
      String customerID = userController.userModel?.customerGuid ?? "";
      int languageId = LocalStorage.getLanguageType();
      debugPrint(customerID);
      String url =
          "${APIRoutes.bookMarkList}$customerID&languageId=$languageId";

      http.Response? response = await HttpService.getApi(
        url: url,
        header: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${userController.userModel!.token}",
        },
      );
      if (response != null && response.statusCode == 200) {
        debugPrint(
            "RESPONSE BODY==========================  $url ======> ${response.body}");

        return bookMarkModelFromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  /// REMOVE BOOKMARK DATA
  ///
  static Future removeBookmarkRepo({
    required String customerGUID,
    required int itemIds,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.removeBookMark,
      requestType: RequestType.Post,
      body: jsonEncode(
        {
          "CustomerGUID": customerGUID,
          "ItemIds": itemIds,
        },
      ),
    );
    if (responseBody != null) {
      return RemoveBookmarkModel.fromJson(responseBody);
    } else {
      return null;
    }
  }

  static Future addBookmarkRepo({
    required String customerGUID,
    required int productId,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.addBookMark,
      requestType: RequestType.Post,
      body: jsonEncode(
        {
          "CustomerGUID": customerGUID,
          "ProductId": productId,
        },
      ),
    );
    if (responseBody != null) {
      return AddBookMarkModel.fromJson(responseBody);
    } else {
      return null;
    }
  }
}
