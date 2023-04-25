import 'package:get/get.dart';

import '../../ui/login_screen/view/forgotpassword_screen.dart';
import '../../ui/login_screen/view/login_screen.dart';
import '../../ui/login_screen/view/signup_screen.dart';
import '../../ui/login_screen/view/splash_screen.dart';
import '../../ui/login_screen/view/welcome_screen.dart';
import '../../ui/menu_screen/view/menu_screen.dart';
import '../../ui/news_screen/view/news_screen.dart';
import '../../ui/setting_screen/view/setting_Screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: NewsScreen.routeName, page: () => const NewsScreen()),
  GetPage(name: MenuScreen.routeName, page: () => const MenuScreen()),
  GetPage(name: SettingScreen.routeName, page: () => const SettingScreen()),
  GetPage(name: SignUpScreen.routeName, page: () => const SignUpScreen()),
  GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
  GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
  GetPage(
      name: ForGotPasswordScreen.routeName,
      page: () => const ForGotPasswordScreen()),
  GetPage(name: WelComeScreen.routeName, page: () => const WelComeScreen()),
];
