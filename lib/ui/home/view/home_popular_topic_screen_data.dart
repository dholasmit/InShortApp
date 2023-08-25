import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/ui/home/controller/home_screen_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../custem_class/utils/local_storage.dart';
import '../../base_screen/controller/base_screen_controller.dart';
import '../../base_screen/view/base_screen.dart';
import '../../base_setting/controller/base_setting_controller.dart';
import '../../explore/controller/explore_controller.dart';
import 'home_images.dart';
import 'home_popular_topic_floating_button.dart';

class HomePopularTopicData extends StatelessWidget {
  static const String routeName = "/HomePopularTopicData";

  String txt = Get.arguments;

  HomePopularTopicData({Key? key}) : super(key: key);
  BaseSettingController baseSettingController =
      Get.find<BaseSettingController>();
  ExploreController exploreController = Get.find<ExploreController>();
  HomeScreenController homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const HomePopularTopicFloatingButton(),
      body: GetBuilder<BaseSettingController>(
        id: "DarkLightMode",
        builder: (baseSettingController) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  LocalStorage.getLightDarkMode()
                      ? AppNightModeImage.bgWithContainerImageNightMode
                      : AppImages.bgWithContainerImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.find<BaseScreenController>().selectedTab = 0;
                          Get.toNamed(BaseScreen.routeName);
                          homeScreenController.homeRecentlyAddedProductsData();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: LocalStorage.getLightDarkMode()
                              ? AppNightModeColor.white
                              : AppColors.black,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        txt,
                        style: TextStyle(
                          color: LocalStorage.getLightDarkMode()
                              ? AppNightModeColor.white
                              : AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Spacer(),
                    ],
                  ),
                ),
                Expanded(
                  child: GetBuilder<ExploreController>(
                    id: "GetProductsByCategory",
                    builder: (exploreController) {
                      return exploreController.exploreLoader
                          ? const Center(child: CircularProgressIndicator())
                          : Swiper(
                              itemCount: exploreController
                                      .getProductsByCategoryModel
                                      ?.data
                                      ?.length ??
                                  0,
                              autoplay: false,
                              scrollDirection: Axis.horizontal,
                              controller: exploreController.pageController,
                              onIndexChanged: exploreController.onChangeIndex,
                              index: exploreController.selectedIndex1,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 25,
                                    top: 35,
                                  ),
                                  child: GestureDetector(
                                    onVerticalDragStart: (details) {
                                      launch(
                                        exploreController
                                            .getProductsByCategoryModel!
                                            .data![index]
                                            .productUrl
                                            .toString(),
                                      );
                                    },
                                    child: Container(
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: LocalStorage.getLightDarkMode()
                                            ? AppColors.black
                                            : AppNightModeColor.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(
                                                    HomeScreenImages.routeName,
                                                    arguments: exploreController
                                                        .getProductsByCategoryModel!
                                                        .data![index]
                                                        .pictureModels![0]
                                                        .imageUrl
                                                        .toString(),
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        exploreController
                                                            .getProductsByCategoryModel!
                                                            .data![index]
                                                            .pictureModels![0]
                                                            .imageUrl
                                                            .toString(),
                                                      ),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    // color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Expanded(
                                              //   child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    exploreController
                                                        .getProductsByCategoryModel!
                                                        .data![index]
                                                        .productName
                                                        .toString(),
                                                    // "Modi ji Newj",
                                                    style: const TextStyle(
                                                      color:
                                                          AppColors.blueColor,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Html(
                                                    data: exploreController
                                                        .getProductsByCategoryModel!
                                                        .data![index]
                                                        .shortDescription
                                                        .toString(),
                                                    style: {
                                                      "body": Style(
                                                        color: LocalStorage
                                                                .getLightDarkMode()
                                                            ? AppNightModeColor
                                                                .white
                                                            : AppColors.black,
                                                      ),
                                                    },
                                                  ),
                                                  const Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      print("More News");
                                                      launch(exploreController
                                                          .getProductsByCategoryModel!
                                                          .data![index]
                                                          .productUrl
                                                          .toString());
                                                    },
                                                    child: Text(
                                                      "onTap for More Details/${exploreController.getProductsByCategoryModel!.data![index].createdXTimeAgo} ago",
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0XFFADADAD),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
