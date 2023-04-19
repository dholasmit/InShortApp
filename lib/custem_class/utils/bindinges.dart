import 'package:get/get.dart';
import 'package:inshorts_newj/ui/setting_screen/controller/setting_controller.dart';

import '../../ui/menu_screen/controller/menuscreen_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
    Get.lazyPut<MenuScreenController>(() => MenuScreenController(),
        fenix: true);
  }
}
