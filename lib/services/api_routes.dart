import 'package:inshorts_newj/custem_class/utils/local_storage.dart';

class APIRoutes {
  //URL 1 with client
  static const baseUrl = "http://panchat.in/api/client/";

  //URL 2 without client
  static const baseUrl2 = "https://panchat.in/api/";

  static String productCategories =
      "${baseUrl}getProductsByCategoryId?categoryId=2&langaugeId=${LocalStorage.getLanguageType}";
  static String categories =
      "${baseUrl}getAllCategories?langaugeId=${LocalStorage.getLanguageType}";
  static const String languages = "${baseUrl}getLanguages";

  /// Working Api
  /// baseurl
  static const String signUp = "${baseUrl}Register";
  static const String login = "${baseUrl}login";

  /// Working Api
  /// baseurl 2
  static String getAllCategories =
      "${baseUrl2}getAllCategories?languageId=${LocalStorage.getLanguageType}";

  // static const String exploreTopicList =
  //     "${baseUrl}RecentlyAddedProducts?languageId=2";
  static const String homeProductsList = "${baseUrl}HomePageProducts";
  static String exploreTopicList =
      "${baseUrl}GetHomePageCategory?languageId=${LocalStorage.getLanguageType}";
  static const String bookMarkList = "${baseUrl}GetBookMark?customerGuid=";
  static const String language2 = "${baseUrl}GetAllLanguages";
  static String recentlyAddedProducts =
      "${baseUrl}RecentlyAddedProducts?languageId=${LocalStorage.getLanguageType}";
  static const String removeBookMark = "${baseUrl}RemoveFromBookMark";
  static const String addBookMark = "${baseUrl}AddToBookMark";
  static String homeScreenRecentlyAddedProducts =
      "${baseUrl}RecentlyAddedProducts?languageId=";
  static const String setLanguage = "${baseUrl}SetLanguage";
  static String getProductsByCategory =
      "${baseUrl}GetProductsByCategoryId?id=29&languageId=${LocalStorage.getLanguageType}";
}
