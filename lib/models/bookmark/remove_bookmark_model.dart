import 'dart:convert';

RemoveBookmarkModel removeBookmarkModelFromJson(String str) =>
    RemoveBookmarkModel.fromJson(json.decode(str));

String removeBookmarkModelToJson(RemoveBookmarkModel data) =>
    json.encode(data.toJson());

class RemoveBookmarkModel {
  int? status;
  String? message;
  Data? data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  RemoveBookmarkModel({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory RemoveBookmarkModel.fromJson(Map<String, dynamic> json) =>
      RemoveBookmarkModel(
        status: json["Status"],
        message: json["Message"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
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

class Data {
  String? customerGuid;
  String? message;

  Data({
    this.customerGuid,
    this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        customerGuid: json["CustomerGuid"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "CustomerGuid": customerGuid,
        "Message": message,
      };
}
