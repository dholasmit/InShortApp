// To parse this JSON data, do
//
//     final homeRecentlyAddedProductsModel = homeRecentlyAddedProductsModelFromJson(jsonString);

import 'dart:convert';

HomeRecentlyAddedProductsModel homeRecentlyAddedProductsModelFromJson(
        String str) =>
    HomeRecentlyAddedProductsModel.fromJson(json.decode(str));

String homeRecentlyAddedProductsModelToJson(
        HomeRecentlyAddedProductsModel data) =>
    json.encode(data.toJson());

class HomeRecentlyAddedProductsModel {
  int? status;
  String? message;
  List<Datum>? data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  HomeRecentlyAddedProductsModel({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory HomeRecentlyAddedProductsModel.fromJson(Map<String, dynamic> json) =>
      HomeRecentlyAddedProductsModel(
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
  String? shortDescription;
  String? fullDescription;
  String? seName;
  String? sku;
  int? productType;
  bool? markAsNew;
  ProductPrice? productPrice;
  List<PictureModel>? pictureModels;
  ProductSpecificationModel? productSpecificationModel;
  ReviewOverviewModel? reviewOverviewModel;
  dynamic categoryName;
  dynamic categorySeName;
  int? visitCount;
  int? id;
  CustomProperties? customProperties;
  bool? bookId;

  Datum({
    this.name,
    this.shortDescription,
    this.fullDescription,
    this.seName,
    this.sku,
    this.productType,
    this.markAsNew,
    this.productPrice,
    this.pictureModels,
    this.productSpecificationModel,
    this.reviewOverviewModel,
    this.categoryName,
    this.categorySeName,
    this.visitCount,
    this.id,
    this.customProperties,
    this.bookId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["Name"],
        shortDescription: json["ShortDescription"],
        fullDescription: json["FullDescription"],
        seName: json["SeName"],
        sku: json["Sku"],
        productType: json["ProductType"],
        markAsNew: json["MarkAsNew"],
        productPrice: json["ProductPrice"] == null
            ? null
            : ProductPrice.fromJson(json["ProductPrice"]),
        pictureModels: json["PictureModels"] == null
            ? []
            : List<PictureModel>.from(
                json["PictureModels"]!.map((x) => PictureModel.fromJson(x))),
        productSpecificationModel: json["ProductSpecificationModel"] == null
            ? null
            : ProductSpecificationModel.fromJson(
                json["ProductSpecificationModel"]),
        reviewOverviewModel: json["ReviewOverviewModel"] == null
            ? null
            : ReviewOverviewModel.fromJson(json["ReviewOverviewModel"]),
        categoryName: json["CategoryName"],
        categorySeName: json["CategorySeName"],
        visitCount: json["VisitCount"],
        id: json["Id"],
        bookId: json["BookId"] ?? false,
        customProperties: json["CustomProperties"] == null
            ? null
            : CustomProperties.fromJson(json["CustomProperties"]),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "ShortDescription": shortDescription,
        "FullDescription": fullDescription,
        "SeName": seName,
        "Sku": sku,
        "ProductType": productType,
        "MarkAsNew": markAsNew,
        "ProductPrice": productPrice?.toJson(),
        "PictureModels": pictureModels == null
            ? []
            : List<dynamic>.from(pictureModels!.map((x) => x.toJson())),
        "ProductSpecificationModel": productSpecificationModel?.toJson(),
        "ReviewOverviewModel": reviewOverviewModel?.toJson(),
        "CategoryName": categoryName,
        "CategorySeName": categorySeName,
        "VisitCount": visitCount,
        "Id": id,
        "CustomProperties": customProperties?.toJson(),
        "BookId": bookId,
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

class ProductPrice {
  dynamic oldPrice;
  dynamic oldPriceValue;
  String? price;
  double? priceValue;
  dynamic basePricePAngV;
  double? basePricePAngVValue;
  bool? disableBuyButton;
  bool? disableWishlistButton;
  bool? disableAddToCompareListButton;
  bool? availableForPreOrder;
  dynamic preOrderAvailabilityStartDateTimeUtc;
  bool? isRental;
  bool? forceRedirectionAfterAddingToCart;
  bool? displayTaxShippingInfo;
  CustomProperties? customProperties;

  ProductPrice({
    this.oldPrice,
    this.oldPriceValue,
    this.price,
    this.priceValue,
    this.basePricePAngV,
    this.basePricePAngVValue,
    this.disableBuyButton,
    this.disableWishlistButton,
    this.disableAddToCompareListButton,
    this.availableForPreOrder,
    this.preOrderAvailabilityStartDateTimeUtc,
    this.isRental,
    this.forceRedirectionAfterAddingToCart,
    this.displayTaxShippingInfo,
    this.customProperties,
  });

  factory ProductPrice.fromJson(Map<String, dynamic> json) => ProductPrice(
        oldPrice: json["OldPrice"],
        oldPriceValue: json["OldPriceValue"],
        price: json["Price"],
        priceValue: json["PriceValue"],
        basePricePAngV: json["BasePricePAngV"],
        basePricePAngVValue: json["BasePricePAngVValue"],
        disableBuyButton: json["DisableBuyButton"],
        disableWishlistButton: json["DisableWishlistButton"],
        disableAddToCompareListButton: json["DisableAddToCompareListButton"],
        availableForPreOrder: json["AvailableForPreOrder"],
        preOrderAvailabilityStartDateTimeUtc:
            json["PreOrderAvailabilityStartDateTimeUtc"],
        isRental: json["IsRental"],
        forceRedirectionAfterAddingToCart:
            json["ForceRedirectionAfterAddingToCart"],
        displayTaxShippingInfo: json["DisplayTaxShippingInfo"],
        customProperties: json["CustomProperties"] == null
            ? null
            : CustomProperties.fromJson(json["CustomProperties"]),
      );

  Map<String, dynamic> toJson() => {
        "OldPrice": oldPrice,
        "OldPriceValue": oldPriceValue,
        "Price": price,
        "PriceValue": priceValue,
        "BasePricePAngV": basePricePAngV,
        "BasePricePAngVValue": basePricePAngVValue,
        "DisableBuyButton": disableBuyButton,
        "DisableWishlistButton": disableWishlistButton,
        "DisableAddToCompareListButton": disableAddToCompareListButton,
        "AvailableForPreOrder": availableForPreOrder,
        "PreOrderAvailabilityStartDateTimeUtc":
            preOrderAvailabilityStartDateTimeUtc,
        "IsRental": isRental,
        "ForceRedirectionAfterAddingToCart": forceRedirectionAfterAddingToCart,
        "DisplayTaxShippingInfo": displayTaxShippingInfo,
        "CustomProperties": customProperties?.toJson(),
      };
}

class ProductSpecificationModel {
  List<dynamic>? groups;
  CustomProperties? customProperties;

  ProductSpecificationModel({
    this.groups,
    this.customProperties,
  });

  factory ProductSpecificationModel.fromJson(Map<String, dynamic> json) =>
      ProductSpecificationModel(
        groups: json["Groups"] == null
            ? []
            : List<dynamic>.from(json["Groups"]!.map((x) => x)),
        customProperties: json["CustomProperties"] == null
            ? null
            : CustomProperties.fromJson(json["CustomProperties"]),
      );

  Map<String, dynamic> toJson() => {
        "Groups":
            groups == null ? [] : List<dynamic>.from(groups!.map((x) => x)),
        "CustomProperties": customProperties?.toJson(),
      };
}

class ReviewOverviewModel {
  int? productId;
  int? ratingSum;
  int? totalReviews;
  bool? allowCustomerReviews;
  bool? canAddNewReview;
  CustomProperties? customProperties;

  ReviewOverviewModel({
    this.productId,
    this.ratingSum,
    this.totalReviews,
    this.allowCustomerReviews,
    this.canAddNewReview,
    this.customProperties,
  });

  factory ReviewOverviewModel.fromJson(Map<String, dynamic> json) =>
      ReviewOverviewModel(
        productId: json["ProductId"],
        ratingSum: json["RatingSum"],
        totalReviews: json["TotalReviews"],
        allowCustomerReviews: json["AllowCustomerReviews"],
        canAddNewReview: json["CanAddNewReview"],
        customProperties: json["CustomProperties"] == null
            ? null
            : CustomProperties.fromJson(json["CustomProperties"]),
      );

  Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "RatingSum": ratingSum,
        "TotalReviews": totalReviews,
        "AllowCustomerReviews": allowCustomerReviews,
        "CanAddNewReview": canAddNewReview,
        "CustomProperties": customProperties?.toJson(),
      };
}
