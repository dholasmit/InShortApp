// // To parse this JSON data, do
// //

// To parse this JSON data, do
//
//     final getProductsByCategoryModel = getProductsByCategoryModelFromJson(jsonString);

import 'dart:convert';

GetProductsByCategoryModel getProductsByCategoryModelFromJson(String str) =>
    GetProductsByCategoryModel.fromJson(json.decode(str));

String getProductsByCategoryModelToJson(GetProductsByCategoryModel data) =>
    json.encode(data.toJson());

class GetProductsByCategoryModel {
  int? status;
  String? message;
  List<Datum>? data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  GetProductsByCategoryModel({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory GetProductsByCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetProductsByCategoryModel(
        status: json["Status"],
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<Datum>.from(json["Data"]!.map((x) => Datum.fromJson(x))),
        validationMessage: json["ValidationMessage"] == null
            ? []
            : List<dynamic>.from(json["ValidationMessage"]!.map((x) => x)),
        errorMessage: json["ErrorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "ValidationMessage": validationMessage == null
            ? []
            : List<dynamic>.from(validationMessage!.map((x) => x)),
        "ErrorMessage": errorMessage,
      };
}

class Datum {
  String? createdXTimeAgo;
  String? productName;
  String? fullDescription;
  String? sku;
  String? shortDescription;
  bool? publish;
  bool? showOnHomePage;
  bool? displayOnHomePage;
  dynamic adminComment;
  bool? markAsNew;
  String? productUrl;
  List<PictureModel>? pictureModels;

  Datum({
    this.createdXTimeAgo,
    this.productName,
    this.fullDescription,
    this.sku,
    this.shortDescription,
    this.publish,
    this.showOnHomePage,
    this.displayOnHomePage,
    this.adminComment,
    this.markAsNew,
    this.productUrl,
    this.pictureModels,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        createdXTimeAgo: json["CreatedXTimeAgo"],
        productName: json["ProductName"],
        fullDescription: json["FullDescription"],
        sku: json["SKU"],
        shortDescription: json["ShortDescription"],
        publish: json["Publish"],
        showOnHomePage: json["ShowOnHomePage"],
        displayOnHomePage: json["DisplayOnHomePage"],
        adminComment: json["AdminComment"],
        markAsNew: json["MarkAsNew"],
        productUrl: json["ProductUrl"],
        pictureModels: json["PictureModels"] == null
            ? []
            : List<PictureModel>.from(
                json["PictureModels"]!.map((x) => PictureModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "CreatedXTimeAgo": createdXTimeAgo,
        "ProductName": productName,
        "FullDescription": fullDescription,
        "SKU": sku,
        "ShortDescription": shortDescription,
        "Publish": publish,
        "ShowOnHomePage": showOnHomePage,
        "DisplayOnHomePage": displayOnHomePage,
        "AdminComment": adminComment,
        "MarkAsNew": markAsNew,
        "ProductUrl": productUrl,
        "PictureModels": pictureModels == null
            ? []
            : List<dynamic>.from(pictureModels!.map((x) => x.toJson())),
      };
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

class CustomProperties {
  CustomProperties();

  factory CustomProperties.fromJson(Map<String, dynamic> json) =>
      CustomProperties();

  Map<String, dynamic> toJson() => {};
}

// //     final getProductsByCategoryModel = getProductsByCategoryModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<GetProductsByCategoryModel> getProductsByCategoryModelFromJson(
//         String str) =>
//     List<GetProductsByCategoryModel>.from(
//         json.decode(str).map((x) => GetProductsByCategoryModel.fromJson(x)));
//
// String getProductsByCategoryModelToJson(
//         List<GetProductsByCategoryModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class GetProductsByCategoryModel {
//   String? productName;
//   String? fullDescription;
//   String? sku;
//   String? shortDescription;
//   bool? publish;
//   bool? showOnHomePage;
//   bool? displayOnHomePage;
//   dynamic adminComment;
//   bool? markAsNew;
//   String? productUrl;
//   List<PictureModel>? pictureModels;
//
//   GetProductsByCategoryModel({
//     this.productName,
//     this.fullDescription,
//     this.sku,
//     this.shortDescription,
//     this.publish,
//     this.showOnHomePage,
//     this.displayOnHomePage,
//     this.adminComment,
//     this.markAsNew,
//     this.productUrl,
//     this.pictureModels,
//   });
//
//   factory GetProductsByCategoryModel.fromJson(Map<String, dynamic> json) =>
//       GetProductsByCategoryModel(
//         productName: json["ProductName"],
//         fullDescription: json["FullDescription"],
//         sku: json["SKU"],
//         shortDescription: json["ShortDescription"],
//         publish: json["Publish"],
//         showOnHomePage: json["ShowOnHomePage"],
//         displayOnHomePage: json["DisplayOnHomePage"],
//         adminComment: json["AdminComment"],
//         markAsNew: json["MarkAsNew"],
//         productUrl: json["ProductUrl"],
//         pictureModels: json["PictureModels"] == null
//             ? []
//             : List<PictureModel>.from(
//                 json["PictureModels"]!.map((x) => PictureModel.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "ProductName": productName,
//         "FullDescription": fullDescription,
//         "SKU": sku,
//         "ShortDescription": shortDescription,
//         "Publish": publish,
//         "ShowOnHomePage": showOnHomePage,
//         "DisplayOnHomePage": displayOnHomePage,
//         "AdminComment": adminComment,
//         "MarkAsNew": markAsNew,
//         "ProductUrl": productUrl,
//         "PictureModels": pictureModels == null
//             ? []
//             : List<dynamic>.from(pictureModels!.map((x) => x.toJson())),
//       };
// }
//
// class PictureModel {
//   String? imageUrl;
//   dynamic thumbImageUrl;
//   String? fullSizeImageUrl;
//   String? title;
//   String? alternateText;
//   CustomProperties? customProperties;
//
//   PictureModel({
//     this.imageUrl,
//     this.thumbImageUrl,
//     this.fullSizeImageUrl,
//     this.title,
//     this.alternateText,
//     this.customProperties,
//   });
//
//   factory PictureModel.fromJson(Map<String, dynamic> json) => PictureModel(
//         imageUrl: json["ImageUrl"],
//         thumbImageUrl: json["ThumbImageUrl"],
//         fullSizeImageUrl: json["FullSizeImageUrl"],
//         title: json["Title"],
//         alternateText: json["AlternateText"],
//         customProperties: json["CustomProperties"] == null
//             ? null
//             : CustomProperties.fromJson(json["CustomProperties"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "ImageUrl": imageUrl,
//         "ThumbImageUrl": thumbImageUrl,
//         "FullSizeImageUrl": fullSizeImageUrl,
//         "Title": title,
//         "AlternateText": alternateText,
//         "CustomProperties": customProperties?.toJson(),
//       };
// }
//
// class CustomProperties {
//   CustomProperties();
//
//   factory CustomProperties.fromJson(Map<String, dynamic> json) =>
//       CustomProperties();
//
//   Map<String, dynamic> toJson() => {};
// }
