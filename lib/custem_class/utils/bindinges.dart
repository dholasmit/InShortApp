import 'package:get/get.dart';
import 'package:inshorts_newj/ui/setting_screen/controller/setting_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
  }
}
