import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? status;
  String? message;
  dynamic data;
  List<String>? validationMessage;
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
        data: json["Data"],
        validationMessage: json["ValidationMessage"] == null
            ? []
            : List<String>.from(json["ValidationMessage"]!.map((x) => x)),
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

// import 'dart:convert';
//
// LoginModel loginModelFromJson(String str) =>
//     LoginModel.fromJson(json.decode(str));
//
// String loginModelToJson(LoginModel data) => json.encode(data.toJson());
//
// class LoginModel {
//   int status;
//   String message;
//   dynamic data;
//   List<String> validationMessage;
//   dynamic errorMessage;
//
//   LoginModel({
//     required this.status,
//     required this.message,
//     this.data,
//     required this.validationMessage,
//     this.errorMessage,
//   });
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         status: json["Status"],
//         message: json["Message"],
//         data: json["Data"],
//         validationMessage:
//             List<String>.from(json["ValidationMessage"].map((x) => x)),
//         errorMessage: json["ErrorMessage"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Status": status,
//         "Message": message,
//         "Data": data,
//         "ValidationMessage":
//             List<dynamic>.from(validationMessage.map((x) => x)),
//         "ErrorMessage": errorMessage,
//       };
// }
