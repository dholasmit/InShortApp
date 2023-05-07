import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_icons.dart';

class BaseSettingController extends GetxController {
  List<String> settingIcon = [
    AppIcons.languageIcons,
    AppIcons.notificationIcons,
    AppIcons.nightMOdeIcons,
    AppIcons.textSizeIcons,
    AppIcons.shareIcons,
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
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    update();
  }

  int _eng = 1;

  int get eng => _eng;

  set eng(int value) {
    _eng = value;
    update();
  }

  int _guj = 2;

  int get guj => _guj;

  set guj(int value) {
    _guj = value;
    update();
  }

  int _hindi = 3;

  int get hindi => _hindi;

  set hindi(int value) {
    _hindi = value;
    update();
  }

  int _group = 1;

  int get group => _group;

  set group(int value) {
    _group = value;
    update();
  }
}
