import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../custem_class/utils/globle.dart';
import '../../models/setting_screen_model/langeuge_model_2.dart';
import '../../models/setting_screen_model/set_language_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';
import '../http_service.dart';

class LanguageApi {
  static Future languageList() async {
    try {
      String url = APIRoutes.language2;
      http.Response? response = await HttpService.getApi(
        url: url,
        header: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${userController.userModel!.token}",
        },
      );
      if (response != null && response.statusCode == 200) {
        print("RESPONSE BODY=================> $url ====>${response.body}");
        return languageModel2FromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  ///  set Language API

  static Future setLanguageApi({
    required String CustomerGuid,
    required int LanguageId,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.setLanguage,
      requestType: RequestType.Post,
      body: jsonEncode(
        {
          "CustomerGuid": CustomerGuid,
          "LanguageId": LanguageId,
        },
      ),
    );
    if (responseBody != null) {
      return SetLanguageModel.fromJson(responseBody);
    } else {
      return null;
    }
  }
}
