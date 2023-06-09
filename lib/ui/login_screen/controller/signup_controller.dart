import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/models/login_screen_model/signup_model.dart';

import '../../../services/login_screen_repo/signup_repo.dart';

class SignUpController extends GetxController {
  final signFormKey = GlobalKey<FormState>();
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
    update();
  }

  SignupModel? _signUpModel;

  SignupModel? get getSignUpModel => _signUpModel;

  set setSignUpModel(SignupModel? value) {
    _signUpModel = value;
    update();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future userSignUp() async {
    Map<String, dynamic> body = {
      "FirstName": firstNameController.text.trim(),
      "LastName": lastNameController.text.trim(),
      "EmailId": emailController.text.trim(),
      "Password": passwordController.text.trim(),
    };
    setSignUpModel = await SignUpApi.signUpUser(body);
    print(getSignUpModel!.data!.message);
    Get.back();
  }

  ///
// Future<void> registerUser() async {
//   var headers = {
//     'Content-Type': 'application/json',
//     'Cookie':
//         '.Nop.Authentication=CfDJ8Ho__D72eQlIrr8GyZfpITG3fdqQuGC07-SXh1OVKMr7H5N18h1F1rdu05h0rDlVbaVaSHkS-lWKYWJ0xKwYppBJLC7gNiAsqP5lfAYA-Yg7hcGPo-rUWqTaR7MMHKVnyNUNo7991ZcbJgLs0UVpBijAzCAMd_vdy3NtqgHj_9FgdzWpYkOnFHCIKImowZ8wgqMB4fvflXFFVAwsFAfhcf15pkUi2IeWIZOEPH67FiuTCEDI5DpUtIYW4qA-N_JtCsRewADbkZ-Qg4sRIpesSood2CltHQllT_XbjLLCJeRLhANy0xHYapt4fVbThZiXEc3AIJvNIqQswlEf8uqGWbHN0QG7vFxp4x_UtOZ3XbDhKMTVMYGGi2GvrGw9ELhZFW9I0GnPTpjc4b9pufFDMJZ-kf8oujsbkFx0XC5eTISuk0AWJS-ONfhPteXQqIjCDNsIzuZb2_uYQDx-pJuEsdr4m6-edQPruJFjkVVPMcPfcTwJYHa5eHLv-T87qLpoTlLmdLD0MijSMj-XtGpER7PWUkOz77ZVxVRbyuNrPtmscKp0u0Q2YURDJLJxI6dGBRq6s-pnOK9u8JuD0ZX9DJk; .Nop.Culture=c%3Den-US%7Cuic%3Den-US; .Nop.Customer=b31db2d6-fece-4357-a4de-aa1ed2eaf7ba'
//   };
//
//   var request = http.Request(
//     'POST',
//     Uri.parse('http://heric6086-001-site1.ftempurl.com/api/client/Register'),
//   );
//   request.body = json.encode({
//     "EmailId": emailController.text.trim(),
//     "Password": passwordController.text.trim(),
//     "FirstName": firstNameController.text.trim(),
//     "LastName": firstNameController.text.trim(),
//   });
//   request.headers.addAll(headers);
//
//   http.StreamedResponse response = await request.send();
//
//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   } else {
//     print(response.reasonPhrase);
//   }
// }
}
