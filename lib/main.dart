import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_settings.dart';
import 'package:inshorts_newj/custem_class/utils/globle.dart';

import 'custem_class/utils/bindinges.dart';
import 'custem_class/utils/localization_serivce.dart';
import 'custem_class/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //SettingController settingController = Get.find<SettingController>();

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
