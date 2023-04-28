import 'package:flutter/material.dart';
import 'package:inshorts_newj/ui/bookmark/view/bookmark_screen.dart';

import '../../ui/explore/view/explore_screen.dart';
import '../../ui/home/view/home_screen.dart';
import '../../ui/login_screen/view/splash_screen.dart';
import '../../ui/profile/view/profile_screen.dart';
import '../constant/app_icons.dart';

// String initialRoute = NewsScreen.routeName;
String initialRoute = SplashScreen.routeName;
int initialTab = 0;
final List<NavigationTabContainModel> navigationTabList = [
  NavigationTabContainModel(icon: AppIcons.homeIcons, name: "Home"),
  NavigationTabContainModel(icon: AppIcons.exploreIcons, name: "Explore"),
  NavigationTabContainModel(icon: AppIcons.bookmarkIcons, name: "Bookmark"),
  NavigationTabContainModel(icon: AppIcons.profileIcons, name: "Profile"),
];
List<Widget> navigationScreensWithHome = const [
  HomeScreen(),
  ExploreScreen(),
  BookmarkScreen(),
  ProfileScreen(),
];

class NavigationTabContainModel {
  final String icon, name;

  NavigationTabContainModel({
    required this.icon,
    required this.name,
  });
}
