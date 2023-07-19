import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/setting_screen_model/langeuge_model_2.dart';
import '../api_routes.dart';
import '../http_service.dart';

class LanguageApi {
  static Future languageList() async {
    try {
      String url = APIRoutes.language2;
      http.Response? response = await HttpService.getApi(
        url: url,
        header: {'Content-Type': 'application/json'},
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
}
