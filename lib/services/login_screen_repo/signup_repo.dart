import 'package:http/http.dart' as http;
import 'package:inshorts_newj/custem_class/constant/app_functions.dart';
import 'package:inshorts_newj/models/login_screen_model/signup_model.dart';
import 'package:inshorts_newj/services/api_routes.dart';
import 'package:inshorts_newj/services/http_service.dart';

import '../../models/login_screen_model/login_model.dart';

// class SignUpRepo {
//   static Future signup({
//     required String firstName,
//     required String lastName,
//     required String emailId,
//     required String password,
//     // required bool newsletter,
//     // required bool acceptPrivacyPolicyPopup,
//     // String? fcmToken,
//   }) async {
//     var responseBody = await API.apiHandler(
//       url: APIRoutes.signUp,
//       body: {
//         "FirstName": firstName,
//         "LastName": lastName,
//         "EmailId": emailId,
//         "Password": password,
//       },
//     );
//     if (responseBody != null) {
//       return responseBody;
//     }
//   }
// }

class SignUpApi {
  static Future<SignupModel?> signUpUser(Map<String, dynamic> body) async {
    try {
      String url = APIRoutes.signUp;
      http.Response? response = await HttpService.postApi(
        url: url,
        body: body,
        header: {'Content-Type': 'application/json'},
      );
      if (response != null && response.statusCode == 200) {
        SignupModel user = signupModelFromJson(response.body);
        flutterToast(user.message!);
        return user;
      } else {
        flutterToast(response!.body);
      }
      return null;
    } catch (e) {
      print("Erorr => $e");
      flutterToast(e.toString());
      return null;
    }
  }
}

class LoginApi {
  static Future<LoginModel?> loginUser(Map<String, dynamic> body) async {
    try {
      String url = APIRoutes.login;
      http.Response? response = await HttpService.postApi(
        url: url,
        body: body,
        header: {'Content-Type': 'application/json'},
      );
      if (response != null && response.statusCode == 200) {
        LoginModel user = loginModelFromJson(response.body);
        flutterToast(user.message!);
        return user;
      } else {
        flutterToast(response!.body);
      }
      return null;
    } catch (e) {
      print("Erorr => $e");
      flutterToast(e.toString());
      return null;
    }
  }
}
