import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_icons.dart';

import '../../../models/setting_screen_model/langeuge_model_2.dart';

class BaseSettingController extends GetxController {
  List<String> settingIcon = [
    AppIcons.languageIcons,
    AppIcons.notificationIcons,
    AppIcons.nightMOdeIcons,
    AppIcons.textSizeIcons,
    AppIcons.settingShareIcons,
    AppIcons.rateIcons,
    AppIcons.feedBackIcons,
    AppIcons.tremsIcons,
    AppIcons.policyIcons,
    AppIcons.logOutIcons,
  ];

  List<String> settingName = [
    "Language",
    "Notification",
    "Night Mode",
    "Text Size",
    "Share this app",
    "Rate As",
    "Feedback",
    "Terms & Conditions",
    "Privacy Policy",
    "Logout",
  ];

  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    update();
  }

  ///
  /// Language Dialog Box Data
  ///

  String _eng = "Eng";

  String get eng => _eng;

  set eng(String value) {
    _eng = value;
    update();
  }

  String _guj = "Guj";

  String get guj => _guj;

  set guj(String value) {
    _guj = value;
    update();
  }

  String _hindi = "Hindi";

  String get hindi => _hindi;

  set hindi(String value) {
    _hindi = value;
    update();
  }

  String _group = "Eng";

  String get group => _group;

  set group(String value) {
    _group = value;
    update();
  }

  ///
  /// Night Mode Dialog Box Data
  ///
  String _light = "Light";

  String get light => _light;

  set light(String value) {
    _light = value;
    update();
  }

  String _dark = "Dark";

  String get dark => _dark;

  set dark(String value) {
    _dark = value;
    update();
  }

  String _system = "System";

  String get system => _system;

  set system(String value) {
    _system = value;
    update();
  }

  String _nightModeGroup = "Light";

  String get nightModeGroup => _nightModeGroup;

  set nightModeGroup(String value) {
    _nightModeGroup = value;
    update();
  }

  ///
  /// Text Size Dialog Box Data
  ///

  String _defaultText = "Default";

  String get defaultText => _defaultText;

  set defaultText(String value) {
    _defaultText = value;
    update();
  }

  String _medium = "Medium";

  String get medium => _medium;

  set medium(String value) {
    _medium = value;
    update();
  }

  String _large = "Large";

  String get large => _large;

  set large(String value) {
    _large = value;
    update();
  }

  String _textSizeGroup = "Default";

  String get textSizeGroup => _textSizeGroup;

  set textSizeGroup(String value) {
    _textSizeGroup = value;
    update();
  }

  /// App share
  Future<void> share() async {
    await FlutterShare.share(
      title: 'In-ShortApp',
      linkUrl: 'app link attached',
    );
  }

  /// language API
  LanguageModel2? _languageModel2;

  LanguageModel2? get getLanguageModel2 => _languageModel2;

  set setLanguageModel2(LanguageModel2? value) {
    _languageModel2 = value;
    update();
  }

  // Future<void> languageListData() async {
  //   setLanguageModel2 = await LanguageApi.languageList();
  //   update(["language"]);
  // }
  //
  // @override
  // void onInit() {
  //   languageListData();
  //   super.onInit();
  // }
}
