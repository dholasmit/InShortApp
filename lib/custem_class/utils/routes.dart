import 'package:get/get.dart';

import '../../ui/menu_screen/view/menu_screen.dart';
import '../../ui/news_screen/view/news_screen.dart';
import '../../ui/setting_screen/view/setting_Screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: NewsScreen.routeName, page: () => const NewsScreen()),
  GetPage(name: MenuScreen.routeName, page: () => const MenuScreen()),
  GetPage(name: SettingScreen.routeName, page: () => const SettingScreen()),
];
