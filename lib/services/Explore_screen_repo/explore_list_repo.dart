import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../custem_class/utils/globle.dart';
import '../../custem_class/utils/local_storage.dart';
import '../../models/explore/explore_topic_model.dart';
import '../../models/explore/getprodectbycategory_model.dart';
import '../api_routes.dart';
import '../http_service.dart';

class ExploreApi {
  // static Future getExploreList() async {
  //   try {
  //     String url = APIRoutes.homeProductsList;
  //     http.Response? response = await HttpService.getApi(
  //       url: url,
  //       header: {
  //         'Content-Type': 'application/json',
  //         'Authorization': "Bearer ${userController.userModel!.token}",
  //       },
  //     );
  //     if (response != null && response.statusCode == 200) {
  //       print("RESPONSE BODY=================> $url ====>${response.body}");
  //       return homePageProductsModelFromJson(response.body);
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //     return null;
  //   }
  // }

  static Future getProductsByCategoryData({required int id}) async {
    try {
      String url1 =
          "${APIRoutes.baseUrl}GetProductsByCategoryId?id=$id&languageId=${LocalStorage.getLanguageType}";
      String url = APIRoutes.getProductsByCategory;

      http.Response? response = await HttpService.getApi(
        url: url1,
        header: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${userController.userModel!.token}",
        },
      );
      if (response != null && response.statusCode == 200) {
        print(
            "RESPONSE BODY================================>$url1 ==> ${response.body}");
        return getProductsByCategoryModelFromJson(response.body);
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
        header: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${userController.userModel!.token}",
        },
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

// static Future recentlyAddedProductsList() async {
//   try {
//     String url = APIRoutes.recentlyAddedProducts;
//     http.Response? response = await HttpService.getApi(
//       url: url,
//       header: {
//         'Content-Type': 'application/json',
//         'Authorization': "Bearer ${userController.userModel!.token}",
//       },
//     );
//     if (response != null && response.statusCode == 200) {
//       print("RESPONSE BODY=================> $url ====>${response.body}");
//       return recentlyAddedProductsModelFromJson(response.body);
//     }
//   } catch (e) {
//     if (kDebugMode) {
//       print(e);
//     }
//     return null;
//   }
// }
}
