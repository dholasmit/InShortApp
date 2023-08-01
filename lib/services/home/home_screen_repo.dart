import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/home/recently_added_products_model.dart';
import '../api_routes.dart';
import '../http_service.dart';

class HomeScreenApi {
  static Future homeRecentlyAddedProducts() async {
    try {
      String url = APIRoutes.homeScreenRecentlyAddedProducts;
      http.Response? response = await HttpService.getApi(
        url: url,
        header: {'Content-Type': 'application/json'},
      );
      if (response != null && response.statusCode == 200) {
        print("RESPONSE BODY=================> $url ====>${response.body}");
        return homeRecentlyAddedProductsModelFromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
