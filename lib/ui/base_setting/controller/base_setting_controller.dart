import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_icons.dart';

import '../../../models/setting_screen_model/langeuge_model_2.dart';
import '../../../models/setting_screen_model/set_language_model.dart';
import '../../../services/setting_screen_repo/language_repo.dart';

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
  List<String> languageName = [
    "Hello",
    "નમસ્તે",
    "नमस्ते",
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

  String termsCondition = "https://panchat.in/conditions-of-use";
  String privacyPolicy = "https://panchat.in/conditions-of-use";

  ///  Language Option Screen
  int _chooseLanguage = 1;

  int get chooseLanguage => _chooseLanguage;

  set chooseLanguage(int value) {
    _chooseLanguage = value;
    update();
  }

  /// Night Mode Dialog Box Data
  int _chooseModeList = 0;

  int get chooseModeList => _chooseModeList;

  set chooseModeList(int value) {
    _chooseModeList = value;
    update();
  }

  List<String> modeList = [
    "Light",
    "Dark",
    "System",
  ];

  /// Text Size Dialog Box Data
  int _chooseFontSize = 0;

  int get chooseFontSize => _chooseFontSize;

  set chooseFontSize(int value) {
    _chooseFontSize = value;
    update();
  }

  List<String> fontSize = [
    "Default",
    "Medium",
    "Large",
  ];

  /// App share
  Future<void> share() async {
    await FlutterShare.share(
      title: 'In-ShortApp',
      linkUrl: 'app link attached',
    );
  }

  /// language List API
  bool languageLoader = false;

  LanguageModel2? _languageModel2;

  LanguageModel2? get getLanguageModel2 => _languageModel2;

  set setLanguageModel2(LanguageModel2? value) {
    _languageModel2 = value;
    update();
  }

  Future<void> languageListData() async {
    languageLoader = true;
    setLanguageModel2 = await LanguageApi.languageList();
    languageLoader = false;
    update(["language"]);
  }

  /// set Language API
  SetLanguageModel? _setLanguageModel;

  SetLanguageModel? get setLanguageModel => _setLanguageModel;

  set setLanguageModel(SetLanguageModel? value) {
    _setLanguageModel = value;
    update();
  }

  Future<void> setLanguage({
    required String CustomerGUID,
    required int ItemIds,
  }) async {
    SetLanguageModel? setLanguageModel = await LanguageApi.setLanguageApi(
      CustomerGuid: CustomerGUID,
      LanguageId: ItemIds,
    );

    if (setLanguageModel != null) {
      return;
    }
  }

  @override
  void onInit() {
    languageListData();
    super.onInit();
  }
}
