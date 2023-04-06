import 'package:get/get.dart';

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

  List<String> languageSelectList = [
    "English",
    "Gujarati",
    "Hindi",
  ];
  String? chosenValue = "English";

// bool _nightModeBtn = false;
//
// bool get nightModeBtn => _nightModeBtn;
//
// set nightModeBtn(bool value) {
//   _nightModeBtn = value;
//   update();
// }
}
