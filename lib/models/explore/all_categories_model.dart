import 'dart:convert';

List<AllCategoriesModel> allCategoriesModelFromJson(String str) =>
    List<AllCategoriesModel>.from(
        json.decode(str).map((x) => AllCategoriesModel.fromJson(x)));

String allCategoriesModelToJson(List<AllCategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCategoriesModel {
  String? name;
  String? seName;
  dynamic description;
  dynamic numberOfProducts;
  bool? includeInTopMenu;
  List<dynamic>? subCategories;
  bool? haveSubCategories;
  PictureModel? pictureModel;
  int? parentcategoryId;
  int? id;
  CustomProperties? customProperties;

  AllCategoriesModel({
    this.name,
    this.seName,
    this.description,
    this.numberOfProducts,
    this.includeInTopMenu,
    this.subCategories,
    this.haveSubCategories,
    this.pictureModel,
    this.parentcategoryId,
    this.id,
    this.customProperties,
  });

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      AllCategoriesModel(
        name: json["Name"],
        seName: json["SeName"],
        description: json["Description"],
        numberOfProducts: json["NumberOfProducts"],
        includeInTopMenu: json["IncludeInTopMenu"],
        subCategories: json["SubCategories"] == null
            ? []
            : List<dynamic>.from(json["SubCategories"]!.map((x) => x)),
        haveSubCategories: json["HaveSubCategories"],
        pictureModel: json["PictureModel"] == null
            ? null
            : PictureModel.fromJson(json["PictureModel"]),
        parentcategoryId: json["ParentcategoryId"],
        id: json["Id"],
        customProperties: json["CustomProperties"] == null
            ? null
            : CustomProperties.fromJson(json["CustomProperties"]),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "SeName": seName,
        "Description": description,
        "NumberOfProducts": numberOfProducts,
        "IncludeInTopMenu": includeInTopMenu,
        "SubCategories": subCategories == null
            ? []
            : List<dynamic>.from(subCategories!.map((x) => x)),
        "HaveSubCategories": haveSubCategories,
        "PictureModel": pictureModel?.toJson(),
        "ParentcategoryId": parentcategoryId,
        "Id": id,
        "CustomProperties": customProperties?.toJson(),
      };
}

class CustomProperties {
  CustomProperties();

  factory CustomProperties.fromJson(Map<String, dynamic> json) =>
      CustomProperties();

  Map<String, dynamic> toJson() => {};
}

class PictureModel {
  String? imageUrl;
  dynamic thumbImageUrl;
  String? fullSizeImageUrl;
  String? title;
  String? alternateText;
  CustomProperties? customProperties;

  PictureModel({
    this.imageUrl,
    this.thumbImageUrl,
    this.fullSizeImageUrl,
    this.title,
    this.alternateText,
    this.customProperties,
  });

  factory PictureModel.fromJson(Map<String, dynamic> json) => PictureModel(
        imageUrl: json["ImageUrl"],
        thumbImageUrl: json["ThumbImageUrl"],
        fullSizeImageUrl: json["FullSizeImageUrl"],
        title: json["Title"],
        alternateText: json["AlternateText"],
        customProperties: json["CustomProperties"] == null
            ? null
            : CustomProperties.fromJson(json["CustomProperties"]),
      );

  Map<String, dynamic> toJson() => {
        "ImageUrl": imageUrl,
        "ThumbImageUrl": thumbImageUrl,
        "FullSizeImageUrl": fullSizeImageUrl,
        "Title": title,
        "AlternateText": alternateText,
        "CustomProperties": customProperties?.toJson(),
      };
}
