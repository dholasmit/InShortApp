import 'dart:convert';

SingnUpModel singnUpModelFromJson(String str) =>
    SingnUpModel.fromJson(json.decode(str));

String singnUpModelToJson(SingnUpModel data) => json.encode(data.toJson());

class SingnUpModel {
  final String email;
  final bool acceptPrivacyPolicyPopup;
  final String password;
  final String confirmPassword;
  final String firstName;
  final bool newsletter;

  SingnUpModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.acceptPrivacyPolicyPopup,
    required this.newsletter,
    required this.firstName,
  });

  factory SingnUpModel.fromJson(Map<String, dynamic> json) => SingnUpModel(
        email: json["Email"],
        password: json["Password"],
        confirmPassword: json["ConfirmPassword"],
        acceptPrivacyPolicyPopup: json["AcceptPrivacyPolicyPopup"],
        newsletter: json["Newsletter"],
        firstName: json["firstName"],
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "Password": password,
        "ConfirmPassword": confirmPassword,
        "firstName": firstName,
        "Newsletter": newsletter,
        "AcceptPrivacyPolicyPopup": acceptPrivacyPolicyPopup,
      };
}
