import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inshorts_newj/custem_class/constant/app_settings.dart';
import 'package:inshorts_newj/custem_class/utils/globle.dart';
import 'package:inshorts_newj/ui/base_screen/view/base_screen.dart';
import 'package:inshorts_newj/ui/login_screen/view/splash_screen.dart';

import 'custem_class/utils/bindinges.dart';
import 'custem_class/utils/local_storage.dart';
import 'custem_class/utils/localization_serivce.dart';
import 'custem_class/utils/routes.dart';

void main() async {
  await GetStorage.init();
  await getInitialRoute();

  runApp(const MyApp());
}

getInitialRoute() async {
  if (LocalStorage.isUserLogin() || LocalStorage.isUserSignUp()) {
    LocalStorage.getUserDetails() || LocalStorage.getSignUpDetails();

    if (userController.userModel != null || userController.signUpData != null) {
      initialRoute = BaseScreen.routeName;
    } else {
      initialRoute = SplashScreen.routeName;
    }
  } else {
    initialRoute = SplashScreen.routeName;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "In-shots",
      debugShowCheckedModeBanner: false,
      initialBinding: BaseBinding(),
      translations: LocalizationService(context),
      locale: LocalizationService.locale,
      themeMode: ThemeMode.system,
      //darkTheme: ThemeData.dark(),
      fallbackLocale: LocalizationService.fallbackLocale,
      initialRoute: initialRoute,
      getPages: routes,
      theme: ThemeData(
        fontFamily: kAppFont,
      ),

      ///  theme: ThemeData.light()
      //  ThemeData.dark(),
    );
  }
}
