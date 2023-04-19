import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    required this.categories,
  });

  List<Category> categories;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.name,
    this.description,
    required this.categoryTemplateId,
    this.metaKeywords,
    this.metaDescription,
    this.metaTitle,
    required this.parentCategoryId,
    required this.pictureId,
    required this.pageSize,
    required this.allowCustomersToSelectPageSize,
    required this.pageSizeOptions,
    required this.showOnHomepage,
    required this.includeInTopMenu,
    required this.subjectToAcl,
    required this.limitedToStores,
    required this.published,
    required this.deleted,
    required this.displayOrder,
    required this.priceRangeFiltering,
    required this.priceFrom,
    required this.priceTo,
    required this.manuallyPriceRange,
    required this.id,
  });

  String name;
  String? description;
  int categoryTemplateId;
  String? metaKeywords;
  String? metaDescription;
  dynamic metaTitle;
  int parentCategoryId;
  int pictureId;
  int pageSize;
  bool allowCustomersToSelectPageSize;
  PageSizeOptions pageSizeOptions;
  bool showOnHomepage;
  bool includeInTopMenu;
  bool subjectToAcl;
  bool limitedToStores;
  bool published;
  bool deleted;
  int displayOrder;
  bool priceRangeFiltering;
  double priceFrom;
  double priceTo;
  bool manuallyPriceRange;
  int id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        description: json["description"],
        categoryTemplateId: json["categoryTemplateId"],
        metaKeywords: json["metaKeywords"],
        metaDescription: json["metaDescription"],
        metaTitle: json["metaTitle"],
        parentCategoryId: json["parentCategoryId"],
        pictureId: json["pictureId"],
        pageSize: json["pageSize"],
        allowCustomersToSelectPageSize: json["allowCustomersToSelectPageSize"],
        pageSizeOptions: pageSizeOptionsValues.map[json["pageSizeOptions"]]!,
        showOnHomepage: json["showOnHomepage"],
        includeInTopMenu: json["includeInTopMenu"],
        subjectToAcl: json["subjectToAcl"],
        limitedToStores: json["limitedToStores"],
        published: json["published"],
        deleted: json["deleted"],
        displayOrder: json["displayOrder"],
        priceRangeFiltering: json["priceRangeFiltering"],
        priceFrom: json["priceFrom"],
        priceTo: json["priceTo"],
        manuallyPriceRange: json["manuallyPriceRange"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "categoryTemplateId": categoryTemplateId,
        "metaKeywords": metaKeywords,
        "metaDescription": metaDescription,
        "metaTitle": metaTitle,
        "parentCategoryId": parentCategoryId,
        "pictureId": pictureId,
        "pageSize": pageSize,
        "allowCustomersToSelectPageSize": allowCustomersToSelectPageSize,
        "pageSizeOptions": pageSizeOptionsValues.reverse[pageSizeOptions],
        "showOnHomepage": showOnHomepage,
        "includeInTopMenu": includeInTopMenu,
        "subjectToAcl": subjectToAcl,
        "limitedToStores": limitedToStores,
        "published": published,
        "deleted": deleted,
        "displayOrder": displayOrder,
        "priceRangeFiltering": priceRangeFiltering,
        "priceFrom": priceFrom,
        "priceTo": priceTo,
        "manuallyPriceRange": manuallyPriceRange,
        "id": id,
      };
}

enum PageSizeOptions { THE_639 }

final pageSizeOptionsValues = EnumValues({"6, 3, 9": PageSizeOptions.THE_639});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
