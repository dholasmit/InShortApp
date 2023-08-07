import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../custem_class/utils/globle.dart';
import '../../custem_class/utils/local_storage.dart';
import '../../models/home/recently_added_products_model.dart';
import '../api_routes.dart';
import '../http_service.dart';

class HomeScreenApi {
  static Future homeRecentlyAddedProducts() async {
    try {
      int languageId = LocalStorage.getLanguageType();
      //String data = "pageNumber=1";
      String url = "${APIRoutes.homeScreenRecentlyAddedProducts}$languageId";
      http.Response? response = await HttpService.getApi(
        url: url,
        header: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${userController.userModel!.token}",
        },
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
