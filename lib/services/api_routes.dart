class APIRoutes {
  static const baseUrl = "http://heric6086-001-site1.ftempurl.com/api/";

  static const String productCategories =
      "${baseUrl}getProductsByCategoryId?categoryId=2&langaugeId=1";
  static const String categories = "${baseUrl}getAllCategories?langaugeId=2";
  static const String languages = "${baseUrl}getLanguages";
  static const String signUp = "${baseUrl}client/Register";
  static const String login = "${baseUrl}client/login";
}
