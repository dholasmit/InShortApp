import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';
import 'package:inshorts_newj/ui/explore/controller/explore_controller.dart';
import 'package:inshorts_newj/ui/home/controller/home_screen_controller.dart';

import '../../../custem_class/constant/app_functions.dart';
import '../../../custem_class/constant/app_settings.dart';
import '../../../custem_class/utils/globle.dart';
import '../../bookmark/controller/book_mark_controller.dart';
import '../controller/base_screen_controller.dart';

class BaseScreen extends StatefulWidget {
  static const String routeName = "/BaseScreen";

  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  BaseScreenController baseScreenController = Get.find<BaseScreenController>();
  BookMarkController bookMarkController = Get.find<BookMarkController>();
  ExploreController exploreController = Get.find<ExploreController>();
  HomeScreenController homeScreenController = Get.find<HomeScreenController>();
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      flutterToast("Press again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: GetBuilder(
          builder: (BaseScreenController controller) => IndexedStack(
            index: controller.selectedTab,
            children: navigationScreensWithHome,
          ),
        ),
        bottomNavigationBar: bottomBar(context),
      ),
    );
  }

  BottomAppBar bottomBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 100,
      child: Container(
        decoration: const BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey,
            //     blurRadius: 10,
            //   ),
            // ],
            ),
        child: GetBuilder(
          builder: (BaseScreenController controller) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: navigationTabList
                .asMap()
                .map(
                  (key, value) => MapEntry(
                    key,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.find<BaseScreenController>().selectedTab = key;
                          if (Get.find<BaseScreenController>().selectedTab ==
                              0) {
                            homeScreenController
                                .homeRecentlyAddedProductsData();
                          } else if (Get.find<BaseScreenController>()
                                  .selectedTab ==
                              1) {
                            exploreController.selectedIndex = 0;
                            exploreController.getProductsByCategoryList(
                                id: exploreController
                                    .getExploreTopicListModel!.data![0].id!);
                          } else if (Get.find<BaseScreenController>()
                                  .selectedTab ==
                              2) {
                            bookMarkController.bookMarkListData();
                          }
                        },
                        child: Container(
                          color: Colors.white,
                          height: 55,
                          child: Center(
                            child: Container(
                              height: 60,
                              // width: MediaQuery.of(context).size.width / 4,
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Image.asset(
                                      value.icon,
                                      height: 20,
                                      width: 20,
                                      color: controller.selectedTab == key
                                          ? AppColors.blueColor
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    value.name.tr,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: kAppFont,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: controller.selectedTab == key
                                          ? AppColors.blueColor
                                          : Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ),
      ),
    );
  }
}
