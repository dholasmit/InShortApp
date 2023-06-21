import 'package:get/get.dart';
import 'package:inshorts_newj/ui/setting_screen/controller/setting_controller.dart';

import '../../shared/image_picker_controller.dart';
import '../../ui/base_screen/controller/base_screen_controller.dart';
import '../../ui/base_setting/controller/base_setting_controller.dart';
import '../../ui/base_setting/controller/edit_profile_controller.dart';
import '../../ui/base_setting/controller/profile _controller.dart';
import '../../ui/bookmark/controller/book_mark_controller.dart';
import '../../ui/explore/controller/explore_controller.dart';
import '../../ui/explore/controller/popular_topic_controller.dart';
import '../../ui/login_screen/controller/forgotpassword_controller.dart';
import '../../ui/login_screen/controller/login_controller.dart';
import '../../ui/login_screen/controller/signup_controller.dart';
import '../../ui/menu_screen/controller/menuscreen_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
    Get.lazyPut<MenuScreenController>(() => MenuScreenController(),
        fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<BaseScreenController>(() => BaseScreenController(),
        fenix: true);
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(),
        fenix: true);
    Get.lazyPut<BookMarkController>(() => BookMarkController(), fenix: true);
    Get.lazyPut<BaseSettingController>(() => BaseSettingController(),
        fenix: true);
    Get.lazyPut<ImagePickerController>(() => ImagePickerController(),
        fenix: true);
    Get.lazyPut<ProfileScreenController>(() => ProfileScreenController(),
        fenix: true);
    Get.lazyPut<EditProfileController>(() => EditProfileController(),
        fenix: true);
    Get.lazyPut<ExploreController>(() => ExploreController(), fenix: true);
    Get.lazyPut<PopularTopicController>(() => PopularTopicController(),
        fenix: true);
  }
}
