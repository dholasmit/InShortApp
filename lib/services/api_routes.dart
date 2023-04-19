class APIRoutes {
  static const String productCategories =
      "http://heric6086-001-site1.ftempurl.com/api/getProductsByCategoryId?categoryId=2&langaugeId=1";
  static const String categories =
      "http://heric6086-001-site1.ftempurl.com/api/getAllCategories?langaugeId=2";
}

const resourceAPIPaginationStart = 1;
const resourceAPIPaginationLimit = 30;

enum ContentType { jsonType }

String contentType(ContentType contentType) {
  String type;
  switch (contentType) {
    case ContentType.jsonType:
      type = "application/json";
      break;
  }
  return type;
}
