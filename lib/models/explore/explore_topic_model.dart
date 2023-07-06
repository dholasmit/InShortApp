import 'dart:convert';

ExploreTopicListModel exploreTopicListModelFromJson(String str) =>
    ExploreTopicListModel.fromJson(json.decode(str));

String exploreTopicListModelToJson(ExploreTopicListModel data) =>
    json.encode(data.toJson());

class ExploreTopicListModel {
  int? status;
  String? message;
  List<Datum>? data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  ExploreTopicListModel({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory ExploreTopicListModel.fromJson(Map<String, dynamic> json) =>
      ExploreTopicListModel(
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
  String? name;
  String? seName;
  dynamic numberOfProducts;
  PictureModel? pictureModel;
  dynamic description;
  dynamic metaKeywords;
  dynamic metaDescription;
  dynamic metaTitle;
  int? parentCategoryId;
  int? pictureId;
  bool? publish;
  bool? showOnHomepage;
  int? id;
  CustomProperties? customProperties;

  Datum({
    this.name,
    this.seName,
    this.numberOfProducts,
    this.pictureModel,
    this.description,
    this.metaKeywords,
    this.metaDescription,
    this.metaTitle,
    this.parentCategoryId,
    this.pictureId,
    this.publish,
    this.showOnHomepage,
    this.id,
    this.customProperties,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["Name"],
        seName: json["SeName"],
        numberOfProducts: json["NumberOfProducts"],
        pictureModel: json["PictureModel"] == null
            ? null
            : PictureModel.fromJson(json["PictureModel"]),
        description: json["Description"],
        metaKeywords: json["MetaKeywords"],
        metaDescription: json["MetaDescription"],
        metaTitle: json["MetaTitle"],
        parentCategoryId: json["ParentCategoryId"],
        pictureId: json["PictureId"],
        publish: json["Publish"],
        showOnHomepage: json["ShowOnHomepage"],
        id: json["Id"],
        customProperties: json["CustomProperties"] == null
            ? null
            : CustomProperties.fromJson(json["CustomProperties"]),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "SeName": seName,
        "NumberOfProducts": numberOfProducts,
        "PictureModel": pictureModel?.toJson(),
        "Description": description,
        "MetaKeywords": metaKeywords,
        "MetaDescription": metaDescription,
        "MetaTitle": metaTitle,
        "ParentCategoryId": parentCategoryId,
        "PictureId": pictureId,
        "Publish": publish,
        "ShowOnHomepage": showOnHomepage,
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
