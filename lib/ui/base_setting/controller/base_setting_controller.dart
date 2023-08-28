import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_icons.dart';

import '../../../custem_class/utils/local_storage.dart';
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

  List<String> settingNameEnglish = [
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
  List<String> settingNameGujarati = [
    "ભાષા",
    "સૂચના",
    "નાઇટ મોડ",
    "ટેક્સ્ટનું કદ",
    "આ એપ્લિકેશન શેર કરો",
    "રેટ કરો",
    "પ્રતિસાદ",
    "શરતોની સ્થિતિ",
    "ગોપનીયતા નીતિ",
    "લૉગ આઉટ",
  ];
  List<String> settingNameHindi = [
    "भाषा",
    "अधिसूचना",
    "रात का मोड",
    "टेक्स्ट का साइज़",
    "इस एप को शेयर कीजिए",
    "रूप में दर",
    "प्रतिक्रिया",
    "नियम व शर्त",
    "गोपनीयता नीति",
    "लॉग आउट",
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
    update(["language"]);
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
    //  "System",
  ];

  bool _isNightMode = false;

  bool get isNightMode => _isNightMode;

  set setIsNightMode(bool value) {
    _isNightMode = value;
    update(["DarkLightMode"]);
  }

  Future<void> onChangeDarkLightMode(int index) async {
    chooseModeList = index;
  }

  /// Text Size Dialog Box Data
  int _chooseFontSize = 0;

  int get chooseFontSize => _chooseFontSize;

  set chooseFontSize(int value) {
    _chooseFontSize = value;
    update(["FontSize"]);
  }

  List<String> fontSize = [
    "Default",
    "Medium",
    "Large",
  ];

  fontsStyle({
    required double defaultSize,
    required double mediumSize,
    required double largeSize,
  }) {
    return LocalStorage.getFontSize() == 0
        ? defaultSize
        : LocalStorage.getFontSize() == 1
            ? mediumSize
            : LocalStorage.getFontSize() == 2
                ? largeSize
                : null;
  }

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
    required String customerGUID,
    required int itemIds,
  }) async {
    SetLanguageModel? setLanguageModel = await LanguageApi.setLanguageApi(
      customerGuid: customerGUID,
      languageId: itemIds,
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
