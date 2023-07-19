import 'package:get/get.dart';

import '../models/login_screen_model/user_model.dart';
import '../models/setting_screen_model/langeuge_model_2.dart';

class UserController extends GetxController {
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  set userModel(UserModel? value) {
    _userModel = value;
    // onUpdateUser();
    update();
  }

  /// Language Model
  LanguageModel2? _languageModel2;

  LanguageModel2? get languageModel2 => _languageModel2;

  set languageModel2(LanguageModel2? value) {
    _languageModel2 = value;
    update();
  }
}
