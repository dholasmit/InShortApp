import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/explore/explore_list_model.dart';
import '../../models/explore/explore_topic_model.dart';
import '../api_routes.dart';
import '../http_service.dart';

class ExploreApi {
  static Future getExploreList() async {
    try {
      String url = APIRoutes.homeProductsList;
      http.Response? response = await HttpService.getApi(
        url: url,
        header: {'Content-Type': 'application/json'},
      );
      if (response != null && response.statusCode == 200) {
        print("RESPONSE BODY=================> $url ====>${response.body}");
        return homePageProductsModelFromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static Future getExploreTopic() async {
    try {
      String url = APIRoutes.exploreTopicList;

      http.Response? response = await HttpService.getApi(
        url: url,
        header: {'Content-Type': 'application/json'},
      );
      if (response != null && response.statusCode == 200) {
        print(
            "RESPONSE BODY=============================== $url=====> ${response.body}");
        return exploreTopicListModelFromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
