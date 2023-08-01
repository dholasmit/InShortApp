// To parse this JSON data, do
//
//     final setLanguageModel = setLanguageModelFromJson(jsonString);

import 'dart:convert';

SetLanguageModel setLanguageModelFromJson(String str) =>
    SetLanguageModel.fromJson(json.decode(str));

String setLanguageModelToJson(SetLanguageModel data) =>
    json.encode(data.toJson());

class SetLanguageModel {
  int? status;
  String? message;
  Data? data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  SetLanguageModel({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory SetLanguageModel.fromJson(Map<String, dynamic> json) =>
      SetLanguageModel(
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
  String? message;

  Data({
    this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
      };
}
