import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/explore/explore_list_model.dart';
import '../api_routes.dart';
import '../http_service.dart';

class ExploreListApi {
  static Future getExploreList() async {
    try {
      String url = APIRoutes.exploreCategoriesList;

      http.Response? response = await HttpService.getApi(
        url: url,
        header: {'Content-Type': 'application/json'},
      );
      if (response != null && response.statusCode == 200) {
        print(
            "RESPONSE BODY================================> ${response.body}");
        return exploreListApiModelFromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
