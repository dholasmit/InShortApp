import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? status;
  String? message;
  Data? data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  LoginModel({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
  String? userName;
  String? emailId;
  String? message;
  bool? isValid;
  bool? rememberMe;
  int? customerId;

  Data({
    this.customerGuid,
    this.userName,
    this.emailId,
    this.message,
    this.isValid,
    this.rememberMe,
    this.customerId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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

// import 'dart:convert';
//
// LoginModel loginModelFromJson(String str) =>
//     LoginModel.fromJson(json.decode(str));
//
// String loginModelToJson(LoginModel data) => json.encode(data.toJson());
//
// class LoginModel {
//   int? status;
//   String? message;
//   dynamic data;
//   List<String>? validationMessage;
//   dynamic errorMessage;
//
//   LoginModel({
//     this.status,
//     this.message,
//     this.data,
//     this.validationMessage,
//     this.errorMessage,
//   });
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         status: json["Status"],
//         message: json["Message"],
//         data: json["Data"],
//         validationMessage: json["ValidationMessage"] == null
//             ? []
//             : List<String>.from(json["ValidationMessage"]!.map((x) => x)),
//         errorMessage: json["ErrorMessage"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Status": status,
//         "Message": message,
//         "Data": data,
//         "ValidationMessage": validationMessage == null
//             ? []
//             : List<dynamic>.from(validationMessage!.map((x) => x)),
//         "ErrorMessage": errorMessage,
//       };
// }
//
// // import 'dart:convert';
// //
// // LoginModel loginModelFromJson(String str) =>
// //     LoginModel.fromJson(json.decode(str));
// //
// // String loginModelToJson(LoginModel data) => json.encode(data.toJson());
// //
// // class LoginModel {
// //   int status;
// //   String message;
// //   dynamic data;
// //   List<String> validationMessage;
// //   dynamic errorMessage;
// //
// //   LoginModel({
// //     required this.status,
// //     required this.message,
// //     this.data,
// //     required this.validationMessage,
// //     this.errorMessage,
// //   });
// //
// //   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
// //         status: json["Status"],
// //         message: json["Message"],
// //         data: json["Data"],
// //         validationMessage:
// //             List<String>.from(json["ValidationMessage"].map((x) => x)),
// //         errorMessage: json["ErrorMessage"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "Status": status,
// //         "Message": message,
// //         "Data": data,
// //         "ValidationMessage":
// //             List<dynamic>.from(validationMessage.map((x) => x)),
// //         "ErrorMessage": errorMessage,
// //       };
// // }
