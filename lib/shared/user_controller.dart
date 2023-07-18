import 'package:get/get.dart';

import '../models/login_screen_model/user_model.dart';

class UserController extends GetxController {
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  set userModel(UserModel? value) {
    _userModel = value;
    // onUpdateUser();
    update();
  }
}
