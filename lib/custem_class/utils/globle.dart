import 'package:flutter/material.dart';
import 'package:inshorts_newj/ui/bookmark/view/bookmark_screen.dart';

import '../../ui/explore/view/explore_screen.dart';
import '../../ui/home/view/home_screen.dart';
import '../../ui/login_screen/view/splash_screen.dart';
import '../../ui/profile/view/base_setting_screen.dart';
import '../constant/app_icons.dart';

// String initialRoute = NewsScreen.routeName;
String initialRoute = SplashScreen.routeName;
int initialTab = 0;
final List<NavigationTabContainModel> navigationTabList = [
  NavigationTabContainModel(icon: AppIcons.homeIcons, name: "Home"),
  NavigationTabContainModel(icon: AppIcons.exploreIcons, name: "Explore"),
  NavigationTabContainModel(icon: AppIcons.bookmarkIcons, name: "Bookmark"),
  NavigationTabContainModel(icon: AppIcons.settingIcons, name: "Settings"),
];
List<Widget> navigationScreensWithHome = const [
  HomeScreen(),
  ExploreScreen(),
  BookmarkScreen(),
  SettingScreen(),
];

class NavigationTabContainModel {
  final String icon, name;

  NavigationTabContainModel({
    required this.icon,
    required this.name,
  });
}
