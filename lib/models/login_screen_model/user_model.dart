import 'dart:convert';

CurrentUserModel currentUserModelFromJson(String str) =>
    CurrentUserModel.fromJson(json.decode(str));

String currentUserModelToJson(CurrentUserModel data) =>
    json.encode(data.toJson());

class CurrentUserModel {
  int? status;
  String? message;
  UserModel? data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  CurrentUserModel({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) =>
      CurrentUserModel(
        status: json["Status"],
        message: json["Message"],
        data: json["Data"] == null ? null : UserModel.fromJson(json["Data"]),
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

class UserModel {
  String? customerGuid;
  String? userName;
  String? emailId;
  String? message;
  bool? isValid;
  bool? rememberMe;
  int? customerId;

  UserModel({
    this.customerGuid,
    this.userName,
    this.emailId,
    this.message,
    this.isValid,
    this.rememberMe,
    this.customerId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        customerGuid: json["CustomerGuid"],
        userName: json["UserName"],
        emailId: json["EmailId"],
        message: json["Message"],
        isValid: json["IsValid"],
        rememberMe: json["RememberMe"],
        customerId: json["CustomerId"],
      );

  Map<String, dynamic> toJson() => {
        "CustomerGuid": customerGuid,
        "UserName": userName,
        "EmailId": emailId,
        "Message": message,
        "IsValid": isValid,
        "RememberMe": rememberMe,
        "CustomerId": customerId,
      };
}
