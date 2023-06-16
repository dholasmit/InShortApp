class APIRoutes {
  static const baseUrl = "https://panchat.in/api/client/";

  static const String productCategories =
      "${baseUrl}getProductsByCategoryId?categoryId=2&langaugeId=1";
  static const String categories = "${baseUrl}getAllCategories?langaugeId=2";
  static const String languages = "${baseUrl}getLanguages";

  /// Working Api
  static const String signUp = "${baseUrl}Register";
  static const String login = "${baseUrl}login";
}
