import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/ui/bookmark/view/bookmark_screen.dart';

import '../../shared/image_picker_controller.dart';
import '../../shared/user_controller.dart';
import '../../ui/base_setting/view/base_setting_screen.dart';
import '../../ui/explore/view/explore_screen.dart';
import '../../ui/home/view/home_screen.dart';
import '../../ui/login_screen/view/splash_screen.dart';
import '../constant/app_icons.dart';

UserController userController = Get.put(UserController());
late AppImagePicker appImagePicker;

// String initialRoute = NewsScreen.routeName;
String initialRoute = SplashScreen.routeName;

globalVerbInit() {
  appImagePicker = AppImagePicker();
}

int initialTab = 0;
// bool isNightMode = false;
final List<NavigationTabContainModel> navigationTabList = [
  NavigationTabContainModel(icon: AppIcons.homeIcons, name: "Home"),
  NavigationTabContainModel(icon: AppIcons.exploreIcons, name: "Explore"),
  NavigationTabContainModel(
      icon: AppIcons.baseScreenBookmarkIcons, name: "Bookmark"),
  NavigationTabContainModel(icon: AppIcons.settingIcons, name: "Settings"),
];
List<Widget> navigationScreensWithHome = [
  HomeScreen(),
  const ExploreScreen(),
  const BookmarkScreen(),
  const SettingScreen(),
];

class NavigationTabContainModel {
  final String icon, name;

  NavigationTabContainModel({
    required this.icon,
    required this.name,
  });
}
