class APIRoutes {
  //URL 1
  static const baseUrl = "https://panchat.in/api/client/";

  //URL 2
  static const baseUrl2 = "https://panchat.in/api/";

  static const String productCategories =
      "${baseUrl}getProductsByCategoryId?categoryId=2&langaugeId=1";
  static const String categories = "${baseUrl}getAllCategories?langaugeId=2";
  static const String languages = "${baseUrl}getLanguages";

  /// Working Api
  /// baseurl
  static const String signUp = "${baseUrl}Register";
  static const String login = "${baseUrl}login";

  /// Working Api
  /// baseurl 2
  static const String getAllCategories =
      "${baseUrl2}getAllCategories?languageId=1";
  // static const String exploreTopicList =
  //     "${baseUrl}RecentlyAddedProducts?languageId=2";
  static const String homeProductsList = "${baseUrl}HomePageProducts";
  static const String exploreTopicList =
      "${baseUrl}GetHomePageCategory?languageId=2";
}
