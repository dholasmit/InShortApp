import 'dart:convert';

BookMarkModel bookMarkModelFromJson(String str) =>
    BookMarkModel.fromJson(json.decode(str));

String bookMarkModelToJson(BookMarkModel data) => json.encode(data.toJson());

class BookMarkModel {
  int? status;
  String? message;
  BookmarkData? data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  BookMarkModel({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory BookMarkModel.fromJson(Map<String, dynamic> json) => BookMarkModel(
        status: json["Status"],
        message: json["Message"],
        data: json["Data"] == null ? null : BookmarkData.fromJson(json["Data"]),
        validationMessage: json["ValidationMessage"] == null
            ? []
            : List<dynamic>.from(json["ValidationMessage"]!.map((x) => x)),
        errorMessage: json["ErrorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": data?.toJson(),
        "ValidationMessage": validationMessage == null
            ? []
            : List<dynamic>.from(validationMessage!.map((x) => x)),
        "ErrorMessage": errorMessage,
      };
}

class BookmarkData {
  String? customerGuid;
  String? customerFullname;
  bool? emailWishlistEnabled;
  bool? showSku;
  bool? showProductImages;
  bool? isEditable;
  bool? displayAddToCart;
  bool? displayTaxShippingInfo;
  List<Item>? items;
  List<dynamic>? warnings;

  // dynamic message;

  BookmarkData({
    this.customerGuid,
    this.customerFullname,
    this.emailWishlistEnabled,
    this.showSku,
    this.showProductImages,
    this.isEditable,
    this.displayAddToCart,
    this.displayTaxShippingInfo,
    this.items,
    this.warnings,

    // this.message,
  });

  factory BookmarkData.fromJson(Map<String, dynamic> json) => BookmarkData(
        customerGuid: json["CustomerGuid"],
        customerFullname: json["CustomerFullname"],
        emailWishlistEnabled: json["EmailWishlistEnabled"],
        showSku: json["ShowSku"],
        showProductImages: json["ShowProductImages"],
        isEditable: json["IsEditable"],
        displayAddToCart: json["DisplayAddToCart"],
        displayTaxShippingInfo: json["DisplayTaxShippingInfo"],
        items: json["Items"] == null
            ? []
            : List<Item>.from(json["Items"]!.map((x) => Item.fromJson(x))),
        warnings: json["Warnings"] == null
            ? []
            : List<dynamic>.from(json["Warnings"]!.map((x) => x)),

        // message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "CustomerGuid": customerGuid,
        "CustomerFullname": customerFullname,
        "EmailWishlistEnabled": emailWishlistEnabled,
        "ShowSku": showSku,
        "ShowProductImages": showProductImages,
        "IsEditable": isEditable,
        "DisplayAddToCart": displayAddToCart,
        "DisplayTaxShippingInfo": displayTaxShippingInfo,
        "Items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "Warnings":
            warnings == null ? [] : List<dynamic>.from(warnings!.map((x) => x)),

        // "Message": message,
      };
}

class Item {
  String? sku;
  Picture? picture;
  int? productId;
  String? productName;
  String? productSeName;

  // dynamic unitPrice;
  dynamic unitPriceValue;

//dynamic subTotal;
  dynamic subTotalValue;

//  dynamic discount;
  dynamic discountValue;

  // dynamic maximumDiscountedQty;
  dynamic quantity;
  List<dynamic>? allowedQuantities;
  String? attributeInfo;

//  dynamic recurringInfo;
  //dynamic rentalInfo;
  bool? allowItemEditing;
  List<dynamic>? warnings;
  dynamic id;
  CustomProperties? customProperties;

  Item({
    this.sku,
    this.picture,
    this.productId,
    this.productName,
    this.productSeName,
    // this.unitPrice,
    this.unitPriceValue,
    // this.subTotal,
    this.subTotalValue,
    // this.discount,
    this.discountValue,
    // this.maximumDiscountedQty,
    this.quantity,
    this.allowedQuantities,
    this.attributeInfo,
    // this.recurringInfo,
    // this.rentalInfo,
    this.allowItemEditing,
    this.warnings,
    this.id,
    this.customProperties,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        sku: json["Sku"],
        picture:
            json["Picture"] == null ? null : Picture.fromJson(json["Picture"]),
        productId: json["ProductId"],
        productName: json["ProductName"],
        productSeName: json["ProductSeName"],
        // unitPrice: json["UnitPrice"],
        unitPriceValue: json["UnitPriceValue"],
        // subTotal: json["SubTotal"],
        subTotalValue: json["SubTotalValue"],
        // discount: json["Discount"],
        discountValue: json["DiscountValue"],
        // maximumDiscountedQty: json["MaximumDiscountedQty"],
        quantity: json["Quantity"],
        allowedQuantities: json["AllowedQuantities"] == null
            ? []
            : List<dynamic>.from(json["AllowedQuantities"]!.map((x) => x)),
        attributeInfo: json["AttributeInfo"],
        // recurringInfo: json["RecurringInfo"],
        // rentalInfo: json["RentalInfo"],
        allowItemEditing: json["AllowItemEditing"],
        warnings: json["Warnings"] == null
            ? []
            : List<dynamic>.from(json["Warnings"]!.map((x) => x)),
        id: json["Id"],
        customProperties: json["CustomProperties"] == null
            ? null
            : CustomProperties.fromJson(json["CustomProperties"]),
      );

  Map<String, dynamic> toJson() => {
        "Sku": sku,
        "Picture": picture?.toJson(),
        "ProductId": productId,
        "ProductName": productName,
        "ProductSeName": productSeName,
        // "UnitPrice": unitPrice,
        "UnitPriceValue": unitPriceValue,
        // "SubTotal": subTotal,
        "SubTotalValue": subTotalValue,
        // "Discount": discount,
        "DiscountValue": discountValue,
        // "MaximumDiscountedQty": maximumDiscountedQty,
        "Quantity": quantity,
        "AllowedQuantities": allowedQuantities == null
            ? []
            : List<dynamic>.from(allowedQuantities!.map((x) => x)),
        "AttributeInfo": attributeInfo,
        // "RecurringInfo": recurringInfo,
        // "RentalInfo": rentalInfo,
        "AllowItemEditing": allowItemEditing,
        "Warnings":
            warnings == null ? [] : List<dynamic>.from(warnings!.map((x) => x)),
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

class Picture {
  String? imageUrl;

//  dynamic thumbImageUrl;
//  dynamic fullSizeImageUrl;
  String? title;
  String? alternateText;

  CustomProperties? customProperties;
  bool isBookMark;

  Picture({
    this.imageUrl,
    // this.thumbImageUrl,
    // this.fullSizeImageUrl,
    this.title,
    this.alternateText,
    this.customProperties,
    required this.isBookMark,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        imageUrl: json["ImageUrl"],
        // thumbImageUrl: json["ThumbImageUrl"],
        // fullSizeImageUrl: json["FullSizeImageUrl"],
        title: json["Title"],
        alternateText: json["AlternateText"],

        customProperties: json["CustomProperties"] == null
            ? null
            : CustomProperties.fromJson(json["CustomProperties"]),
        isBookMark: json["isBookMark"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "ImageUrl": imageUrl,
        // "ThumbImageUrl": thumbImageUrl,
        // "FullSizeImageUrl": fullSizeImageUrl,
        "Title": title,
        "AlternateText": alternateText,
        "CustomProperties": customProperties?.toJson(),
        "isBookMark": isBookMark,
      };
}
