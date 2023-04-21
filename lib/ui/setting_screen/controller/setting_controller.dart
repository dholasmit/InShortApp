import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/setting_screen_model/language_model.dart';
import '../../../services/api_routes.dart';

class SettingController extends GetxController {
  bool _languageBtn = false;

  bool get languageBtn => _languageBtn;

  set languageBtn(bool value) {
    _languageBtn = value;
    update();
  }

  bool _hdImageBtn = false;

  bool get hdImageBtn => _hdImageBtn;

  set hdImageBtn(bool value) {
    _hdImageBtn = value;
    update();
  }

  bool _nightModeBtn = false;

  bool get nightModeBtn => _nightModeBtn;

  set nightModeBtn(bool value) {
    _nightModeBtn = value;
    update();
  }

  /// language model

  LanguageModel? languageModel;

  String? chosenValue;

  /// onInit
  @override
  void onInit() {
    languageListData();
    super.onInit();
  }

  Future<void> languageListData() async {
    String url = APIRoutes.languages;
    final response = await http.get(Uri.parse(url));
    debugPrint("url=========>$url");
    if (response.statusCode == 200) {
      languageModel = languageModelFromJson(response.body);
      print("RESPONSE ==========>  ${response.body}");
      chosenValue = languageModel!.languages.first.name;
      update(["Languages"]);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
