import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) =>
    ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) =>
    json.encode(data.toJson());

class ForgotPasswordModel {
  int? status;
  String? message;
  dynamic data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  ForgotPasswordModel({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        status: json["Status"],
        message: json["Message"],
        data: json["Data"],
        validationMessage: json["ValidationMessage"] == null
            ? []
            : List<dynamic>.from(json["ValidationMessage"]!.map((x) => x)),
        errorMessage: json["ErrorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": data,
        "ValidationMessage": validationMessage == null
            ? []
            : List<dynamic>.from(validationMessage!.map((x) => x)),
        "ErrorMessage": errorMessage,
      };
}
