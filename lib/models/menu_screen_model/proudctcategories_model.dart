// To parse this JSON data, do
//
//     final productCategoriesModel = productCategoriesModelFromJson(jsonString);

import 'dart:convert';

ProductCategoriesModel productCategoriesModelFromJson(String str) =>
    ProductCategoriesModel.fromJson(json.decode(str));

String productCategoriesModelToJson(ProductCategoriesModel data) =>
    json.encode(data.toJson());

class ProductCategoriesModel {
  ProductCategoriesModel({
    required this.products,
  });

  List<Product> products;

  factory ProductCategoriesModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoriesModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.productTypeId,
    required this.parentGroupedProductId,
    required this.visibleIndividually,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    this.adminComment,
    required this.productTemplateId,
    required this.vendorId,
    required this.showOnHomepage,
    this.metaKeywords,
    this.metaDescription,
    this.metaTitle,
    required this.allowCustomerReviews,
    required this.approvedRatingSum,
    required this.notApprovedRatingSum,
    required this.approvedTotalReviews,
    required this.notApprovedTotalReviews,
    required this.subjectToAcl,
    required this.limitedToStores,
    required this.sku,
    this.manufacturerPartNumber,
    this.gtin,
    required this.isGiftCard,
    required this.giftCardTypeId,
    this.overriddenGiftCardAmount,
    required this.requireOtherProducts,
    this.requiredProductIds,
    required this.automaticallyAddRequiredProducts,
    required this.isDownload,
    required this.downloadId,
    required this.unlimitedDownloads,
    required this.maxNumberOfDownloads,
    this.downloadExpirationDays,
    required this.downloadActivationTypeId,
    required this.hasSampleDownload,
    required this.sampleDownloadId,
    required this.hasUserAgreement,
    this.userAgreementText,
    required this.isRecurring,
    required this.recurringCycleLength,
    required this.recurringCyclePeriodId,
    required this.recurringTotalCycles,
    required this.isRental,
    required this.rentalPriceLength,
    required this.rentalPricePeriodId,
    required this.isShipEnabled,
    required this.isFreeShipping,
    required this.shipSeparately,
    required this.additionalShippingCharge,
    required this.deliveryDateId,
    required this.isTaxExempt,
    required this.taxCategoryId,
    required this.isTelecommunicationsOrBroadcastingOrElectronicServices,
    required this.manageInventoryMethodId,
    required this.productAvailabilityRangeId,
    required this.useMultipleWarehouses,
    required this.warehouseId,
    required this.stockQuantity,
    required this.displayStockAvailability,
    required this.displayStockQuantity,
    required this.minStockQuantity,
    required this.lowStockActivityId,
    required this.notifyAdminForQuantityBelow,
    required this.backorderModeId,
    required this.allowBackInStockSubscriptions,
    required this.orderMinimumQuantity,
    required this.orderMaximumQuantity,
    this.allowedQuantities,
    required this.allowAddingOnlyExistingAttributeCombinations,
    required this.notReturnable,
    required this.disableBuyButton,
    required this.disableWishlistButton,
    required this.availableForPreOrder,
    this.preOrderAvailabilityStartDateTimeUtc,
    required this.callForPrice,
    required this.price,
    required this.oldPrice,
    required this.productCost,
    required this.customerEntersPrice,
    required this.minimumCustomerEnteredPrice,
    required this.maximumCustomerEnteredPrice,
    required this.basepriceEnabled,
    required this.basepriceAmount,
    required this.basepriceUnitId,
    required this.basepriceBaseAmount,
    required this.basepriceBaseUnitId,
    required this.markAsNew,
    this.markAsNewStartDateTimeUtc,
    this.markAsNewEndDateTimeUtc,
    required this.hasTierPrices,
    required this.hasDiscountsApplied,
    required this.weight,
    required this.length,
    required this.width,
    required this.height,
    this.availableStartDateTimeUtc,
    this.availableEndDateTimeUtc,
    required this.displayOrder,
    required this.published,
    required this.deleted,
    required this.createdOnUtc,
    required this.updatedOnUtc,
    required this.productType,
    required this.backorderMode,
    required this.downloadActivationType,
    required this.giftCardType,
    required this.lowStockActivity,
    required this.manageInventoryMethod,
    required this.recurringCyclePeriod,
    required this.rentalPricePeriod,
    required this.id,
  });

  int productTypeId;
  int parentGroupedProductId;
  bool visibleIndividually;
  String name;
  String shortDescription;
  String fullDescription;
  dynamic adminComment;
  int productTemplateId;
  int vendorId;
  bool showOnHomepage;
  dynamic metaKeywords;
  dynamic metaDescription;
  dynamic metaTitle;
  bool allowCustomerReviews;
  int approvedRatingSum;
  int notApprovedRatingSum;
  int approvedTotalReviews;
  int notApprovedTotalReviews;
  bool subjectToAcl;
  bool limitedToStores;
  String sku;
  dynamic manufacturerPartNumber;
  dynamic gtin;
  bool isGiftCard;
  int giftCardTypeId;
  dynamic overriddenGiftCardAmount;
  bool requireOtherProducts;
  dynamic requiredProductIds;
  bool automaticallyAddRequiredProducts;
  bool isDownload;
  int downloadId;
  bool unlimitedDownloads;
  int maxNumberOfDownloads;
  dynamic downloadExpirationDays;
  int downloadActivationTypeId;
  bool hasSampleDownload;
  int sampleDownloadId;
  bool hasUserAgreement;
  dynamic userAgreementText;
  bool isRecurring;
  int recurringCycleLength;
  int recurringCyclePeriodId;
  int recurringTotalCycles;
  bool isRental;
  int rentalPriceLength;
  int rentalPricePeriodId;
  bool isShipEnabled;
  bool isFreeShipping;
  bool shipSeparately;
  int additionalShippingCharge;
  int deliveryDateId;
  bool isTaxExempt;
  int taxCategoryId;
  bool isTelecommunicationsOrBroadcastingOrElectronicServices;
  int manageInventoryMethodId;
  int productAvailabilityRangeId;
  bool useMultipleWarehouses;
  int warehouseId;
  int stockQuantity;
  bool displayStockAvailability;
  bool displayStockQuantity;
  int minStockQuantity;
  int lowStockActivityId;
  int notifyAdminForQuantityBelow;
  int backorderModeId;
  bool allowBackInStockSubscriptions;
  int orderMinimumQuantity;
  int orderMaximumQuantity;
  dynamic allowedQuantities;
  bool allowAddingOnlyExistingAttributeCombinations;
  bool notReturnable;
  bool disableBuyButton;
  bool disableWishlistButton;
  bool availableForPreOrder;
  dynamic preOrderAvailabilityStartDateTimeUtc;
  bool callForPrice;
  int price;
  int oldPrice;
  int productCost;
  bool customerEntersPrice;
  int minimumCustomerEnteredPrice;
  int maximumCustomerEnteredPrice;
  bool basepriceEnabled;
  int basepriceAmount;
  int basepriceUnitId;
  int basepriceBaseAmount;
  int basepriceBaseUnitId;
  bool markAsNew;
  dynamic markAsNewStartDateTimeUtc;
  dynamic markAsNewEndDateTimeUtc;
  bool hasTierPrices;
  bool hasDiscountsApplied;
  int weight;
  int length;
  int width;
  int height;
  dynamic availableStartDateTimeUtc;
  dynamic availableEndDateTimeUtc;
  int displayOrder;
  bool published;
  bool deleted;
  DateTime createdOnUtc;
  DateTime updatedOnUtc;
  int productType;
  int backorderMode;
  int downloadActivationType;
  int giftCardType;
  int lowStockActivity;
  int manageInventoryMethod;
  int recurringCyclePeriod;
  int rentalPricePeriod;
  int id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productTypeId: json["ProductTypeId"],
        parentGroupedProductId: json["ParentGroupedProductId"],
        visibleIndividually: json["VisibleIndividually"],
        name: json["Name"],
        shortDescription: json["ShortDescription"],
        fullDescription: json["FullDescription"],
        adminComment: json["AdminComment"],
        productTemplateId: json["ProductTemplateId"],
        vendorId: json["VendorId"],
        showOnHomepage: json["ShowOnHomepage"],
        metaKeywords: json["MetaKeywords"],
        metaDescription: json["MetaDescription"],
        metaTitle: json["MetaTitle"],
        allowCustomerReviews: json["AllowCustomerReviews"],
        approvedRatingSum: json["ApprovedRatingSum"],
        notApprovedRatingSum: json["NotApprovedRatingSum"],
        approvedTotalReviews: json["ApprovedTotalReviews"],
        notApprovedTotalReviews: json["NotApprovedTotalReviews"],
        subjectToAcl: json["SubjectToAcl"],
        limitedToStores: json["LimitedToStores"],
        sku: json["Sku"],
        manufacturerPartNumber: json["ManufacturerPartNumber"],
        gtin: json["Gtin"],
        isGiftCard: json["IsGiftCard"],
        giftCardTypeId: json["GiftCardTypeId"],
        overriddenGiftCardAmount: json["OverriddenGiftCardAmount"],
        requireOtherProducts: json["RequireOtherProducts"],
        requiredProductIds: json["RequiredProductIds"],
        automaticallyAddRequiredProducts:
            json["AutomaticallyAddRequiredProducts"],
        isDownload: json["IsDownload"],
        downloadId: json["DownloadId"],
        unlimitedDownloads: json["UnlimitedDownloads"],
        maxNumberOfDownloads: json["MaxNumberOfDownloads"],
        downloadExpirationDays: json["DownloadExpirationDays"],
        downloadActivationTypeId: json["DownloadActivationTypeId"],
        hasSampleDownload: json["HasSampleDownload"],
        sampleDownloadId: json["SampleDownloadId"],
        hasUserAgreement: json["HasUserAgreement"],
        userAgreementText: json["UserAgreementText"],
        isRecurring: json["IsRecurring"],
        recurringCycleLength: json["RecurringCycleLength"],
        recurringCyclePeriodId: json["RecurringCyclePeriodId"],
        recurringTotalCycles: json["RecurringTotalCycles"],
        isRental: json["IsRental"],
        rentalPriceLength: json["RentalPriceLength"],
        rentalPricePeriodId: json["RentalPricePeriodId"],
        isShipEnabled: json["IsShipEnabled"],
        isFreeShipping: json["IsFreeShipping"],
        shipSeparately: json["ShipSeparately"],
        additionalShippingCharge: json["AdditionalShippingCharge"],
        deliveryDateId: json["DeliveryDateId"],
        isTaxExempt: json["IsTaxExempt"],
        taxCategoryId: json["TaxCategoryId"],
        isTelecommunicationsOrBroadcastingOrElectronicServices:
            json["IsTelecommunicationsOrBroadcastingOrElectronicServices"],
        manageInventoryMethodId: json["ManageInventoryMethodId"],
        productAvailabilityRangeId: json["ProductAvailabilityRangeId"],
        useMultipleWarehouses: json["UseMultipleWarehouses"],
        warehouseId: json["WarehouseId"],
        stockQuantity: json["StockQuantity"],
        displayStockAvailability: json["DisplayStockAvailability"],
        displayStockQuantity: json["DisplayStockQuantity"],
        minStockQuantity: json["MinStockQuantity"],
        lowStockActivityId: json["LowStockActivityId"],
        notifyAdminForQuantityBelow: json["NotifyAdminForQuantityBelow"],
        backorderModeId: json["BackorderModeId"],
        allowBackInStockSubscriptions: json["AllowBackInStockSubscriptions"],
        orderMinimumQuantity: json["OrderMinimumQuantity"],
        orderMaximumQuantity: json["OrderMaximumQuantity"],
        allowedQuantities: json["AllowedQuantities"],
        allowAddingOnlyExistingAttributeCombinations:
            json["AllowAddingOnlyExistingAttributeCombinations"],
        notReturnable: json["NotReturnable"],
        disableBuyButton: json["DisableBuyButton"],
        disableWishlistButton: json["DisableWishlistButton"],
        availableForPreOrder: json["AvailableForPreOrder"],
        preOrderAvailabilityStartDateTimeUtc:
            json["PreOrderAvailabilityStartDateTimeUtc"],
        callForPrice: json["CallForPrice"],
        price: json["Price"],
        oldPrice: json["OldPrice"],
        productCost: json["ProductCost"],
        customerEntersPrice: json["CustomerEntersPrice"],
        minimumCustomerEnteredPrice: json["MinimumCustomerEnteredPrice"],
        maximumCustomerEnteredPrice: json["MaximumCustomerEnteredPrice"],
        basepriceEnabled: json["BasepriceEnabled"],
        basepriceAmount: json["BasepriceAmount"],
        basepriceUnitId: json["BasepriceUnitId"],
        basepriceBaseAmount: json["BasepriceBaseAmount"],
        basepriceBaseUnitId: json["BasepriceBaseUnitId"],
        markAsNew: json["MarkAsNew"],
        markAsNewStartDateTimeUtc: json["MarkAsNewStartDateTimeUtc"],
        markAsNewEndDateTimeUtc: json["MarkAsNewEndDateTimeUtc"],
        hasTierPrices: json["HasTierPrices"],
        hasDiscountsApplied: json["HasDiscountsApplied"],
        weight: json["Weight"],
        length: json["Length"],
        width: json["Width"],
        height: json["Height"],
        availableStartDateTimeUtc: json["AvailableStartDateTimeUtc"],
        availableEndDateTimeUtc: json["AvailableEndDateTimeUtc"],
        displayOrder: json["DisplayOrder"],
        published: json["Published"],
        deleted: json["Deleted"],
        createdOnUtc: DateTime.parse(json["CreatedOnUtc"]),
        updatedOnUtc: DateTime.parse(json["UpdatedOnUtc"]),
        productType: json["ProductType"],
        backorderMode: json["BackorderMode"],
        downloadActivationType: json["DownloadActivationType"],
        giftCardType: json["GiftCardType"],
        lowStockActivity: json["LowStockActivity"],
        manageInventoryMethod: json["ManageInventoryMethod"],
        recurringCyclePeriod: json["RecurringCyclePeriod"],
        rentalPricePeriod: json["RentalPricePeriod"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "ProductTypeId": productTypeId,
        "ParentGroupedProductId": parentGroupedProductId,
        "VisibleIndividually": visibleIndividually,
        "Name": name,
        "ShortDescription": shortDescription,
        "FullDescription": fullDescription,
        "AdminComment": adminComment,
        "ProductTemplateId": productTemplateId,
        "VendorId": vendorId,
        "ShowOnHomepage": showOnHomepage,
        "MetaKeywords": metaKeywords,
        "MetaDescription": metaDescription,
        "MetaTitle": metaTitle,
        "AllowCustomerReviews": allowCustomerReviews,
        "ApprovedRatingSum": approvedRatingSum,
        "NotApprovedRatingSum": notApprovedRatingSum,
        "ApprovedTotalReviews": approvedTotalReviews,
        "NotApprovedTotalReviews": notApprovedTotalReviews,
        "SubjectToAcl": subjectToAcl,
        "LimitedToStores": limitedToStores,
        "Sku": sku,
        "ManufacturerPartNumber": manufacturerPartNumber,
        "Gtin": gtin,
        "IsGiftCard": isGiftCard,
        "GiftCardTypeId": giftCardTypeId,
        "OverriddenGiftCardAmount": overriddenGiftCardAmount,
        "RequireOtherProducts": requireOtherProducts,
        "RequiredProductIds": requiredProductIds,
        "AutomaticallyAddRequiredProducts": automaticallyAddRequiredProducts,
        "IsDownload": isDownload,
        "DownloadId": downloadId,
        "UnlimitedDownloads": unlimitedDownloads,
        "MaxNumberOfDownloads": maxNumberOfDownloads,
        "DownloadExpirationDays": downloadExpirationDays,
        "DownloadActivationTypeId": downloadActivationTypeId,
        "HasSampleDownload": hasSampleDownload,
        "SampleDownloadId": sampleDownloadId,
        "HasUserAgreement": hasUserAgreement,
        "UserAgreementText": userAgreementText,
        "IsRecurring": isRecurring,
        "RecurringCycleLength": recurringCycleLength,
        "RecurringCyclePeriodId": recurringCyclePeriodId,
        "RecurringTotalCycles": recurringTotalCycles,
        "IsRental": isRental,
        "RentalPriceLength": rentalPriceLength,
        "RentalPricePeriodId": rentalPricePeriodId,
        "IsShipEnabled": isShipEnabled,
        "IsFreeShipping": isFreeShipping,
        "ShipSeparately": shipSeparately,
        "AdditionalShippingCharge": additionalShippingCharge,
        "DeliveryDateId": deliveryDateId,
        "IsTaxExempt": isTaxExempt,
        "TaxCategoryId": taxCategoryId,
        "IsTelecommunicationsOrBroadcastingOrElectronicServices":
            isTelecommunicationsOrBroadcastingOrElectronicServices,
        "ManageInventoryMethodId": manageInventoryMethodId,
        "ProductAvailabilityRangeId": productAvailabilityRangeId,
        "UseMultipleWarehouses": useMultipleWarehouses,
        "WarehouseId": warehouseId,
        "StockQuantity": stockQuantity,
        "DisplayStockAvailability": displayStockAvailability,
        "DisplayStockQuantity": displayStockQuantity,
        "MinStockQuantity": minStockQuantity,
        "LowStockActivityId": lowStockActivityId,
        "NotifyAdminForQuantityBelow": notifyAdminForQuantityBelow,
        "BackorderModeId": backorderModeId,
        "AllowBackInStockSubscriptions": allowBackInStockSubscriptions,
        "OrderMinimumQuantity": orderMinimumQuantity,
        "OrderMaximumQuantity": orderMaximumQuantity,
        "AllowedQuantities": allowedQuantities,
        "AllowAddingOnlyExistingAttributeCombinations":
            allowAddingOnlyExistingAttributeCombinations,
        "NotReturnable": notReturnable,
        "DisableBuyButton": disableBuyButton,
        "DisableWishlistButton": disableWishlistButton,
        "AvailableForPreOrder": availableForPreOrder,
        "PreOrderAvailabilityStartDateTimeUtc":
            preOrderAvailabilityStartDateTimeUtc,
        "CallForPrice": callForPrice,
        "Price": price,
        "OldPrice": oldPrice,
        "ProductCost": productCost,
        "CustomerEntersPrice": customerEntersPrice,
        "MinimumCustomerEnteredPrice": minimumCustomerEnteredPrice,
        "MaximumCustomerEnteredPrice": maximumCustomerEnteredPrice,
        "BasepriceEnabled": basepriceEnabled,
        "BasepriceAmount": basepriceAmount,
        "BasepriceUnitId": basepriceUnitId,
        "BasepriceBaseAmount": basepriceBaseAmount,
        "BasepriceBaseUnitId": basepriceBaseUnitId,
        "MarkAsNew": markAsNew,
        "MarkAsNewStartDateTimeUtc": markAsNewStartDateTimeUtc,
        "MarkAsNewEndDateTimeUtc": markAsNewEndDateTimeUtc,
        "HasTierPrices": hasTierPrices,
        "HasDiscountsApplied": hasDiscountsApplied,
        "Weight": weight,
        "Length": length,
        "Width": width,
        "Height": height,
        "AvailableStartDateTimeUtc": availableStartDateTimeUtc,
        "AvailableEndDateTimeUtc": availableEndDateTimeUtc,
        "DisplayOrder": displayOrder,
        "Published": published,
        "Deleted": deleted,
        "CreatedOnUtc": createdOnUtc.toIso8601String(),
        "UpdatedOnUtc": updatedOnUtc.toIso8601String(),
        "ProductType": productType,
        "BackorderMode": backorderMode,
        "DownloadActivationType": downloadActivationType,
        "GiftCardType": giftCardType,
        "LowStockActivity": lowStockActivity,
        "ManageInventoryMethod": manageInventoryMethod,
        "RecurringCyclePeriod": recurringCyclePeriod,
        "RentalPricePeriod": rentalPricePeriod,
        "id": id,
      };
}
