import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:inshorts_newj/services/api_routes.dart';

import '../../models/explore/all_categories_model.dart';
import '../http_service.dart';

class PopularTopicApi {
  static Future getPopularTopic() async {
    try {
      String url = APIRoutes.getAllCategories;

      http.Response? response = await HttpService.getApi(
        url: url,
        header: {'Content-Type': 'application/json'},
      );
      if (response != null && response.statusCode == 200) {
        print(
            "RESPONSE BODY================================> ${response.body}");
        return allCategoriesModelFromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
