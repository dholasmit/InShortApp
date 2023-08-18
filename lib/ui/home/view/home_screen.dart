import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../custem_class/utils/local_storage.dart';
import '../../../shared/home_screen_floating_btn.dart';
import '../../base_setting/controller/base_setting_controller.dart';
import '../controller/home_screen_controller.dart';
import 'home_images.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  BaseSettingController baseSettingController =
      Get.find<BaseSettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FoldableOptions(),
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
                fit: BoxFit.fitWidth,
              ),
            ),
            child: GetBuilder<HomeScreenController>(
              id: "product",
              builder: (controller) {
                return controller.loader
                    ? const Center(child: CircularProgressIndicator())
                    : Swiper(
                        itemCount: controller
                            .getHomeRecentlyAddedProductsModel!.data!.length,
                        autoplay: false,
                        // transformer: PageT,
                        scrollDirection: Axis.horizontal,
                        controller: controller.pageController,
                        onIndexChanged: controller.onChangeIndex,
                        index: controller.selectedIndex,
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
                                launch(controller
                                    .getHomeRecentlyAddedProductsModel!
                                    .data![index]
                                    .prouductUrl!
                                    .toString());
                              },
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: LocalStorage.getLightDarkMode()
                                        ? AppColors.black
                                        : AppNightModeColor.white),
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
                                              arguments: controller
                                                  .getHomeRecentlyAddedProductsModel!
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
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  controller
                                                      .getHomeRecentlyAddedProductsModel!
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
                                              controller
                                                  .getHomeRecentlyAddedProductsModel!
                                                  .data![index]
                                                  .name
                                                  .toString(),
                                              // "Modi ji Newj",
                                              style: const TextStyle(
                                                color: AppColors.blueColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Html(
                                              data: controller
                                                  .getHomeRecentlyAddedProductsModel!
                                                  .data![index]
                                                  .shortDescription
                                                  .toString(),
                                              style: {
                                                "body": Style(
                                                  color: LocalStorage
                                                          .getLightDarkMode()
                                                      ? AppNightModeColor.white
                                                      : AppColors.black,
                                                ),
                                              },
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {
                                                print("More News");
                                                launch(controller
                                                    .getHomeRecentlyAddedProductsModel!
                                                    .data![index]
                                                    .prouductUrl!
                                                    .toString());
                                              },
                                              child: Text(
                                                "onTap for More Details/${controller.getHomeRecentlyAddedProductsModel!.data![index].createdXTimeAgo} ago",
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0XFFADADAD),
                                                  fontWeight: FontWeight.w400,
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
          );
        },
      ),
    );
  }
}

///Floating Action Button
// floatingActionButton: GetBuilder<HomeScreenController>(
//   id: "flot",
//   builder: (controller) {
//     print("flot ==> ${controller.flotClose}");
//     return controller.loader
//         ? const Center(child: SizedBox())
//         : ExpandableFab(
//             distance: 70.0,
//             initialOpen: controller.flotClose,
//             children: [
//               ActionButton(
//                 onPressed: () {
//                   print("liked");
//                   print(
//                       "PRODUCT URL ============>${controller.getHomeRecentlyAddedProductsModel!.data![controller.selectedIndex].prouductUrl!}");
//                   launch(controller.getHomeRecentlyAddedProductsModel!
//                       .data![controller.selectedIndex].prouductUrl!
//                       .toString());
//                 },
//                 icon: Image.asset(
//                   AppIcons.browserIcons,
//                   color: AppColors.blueColor,
//                   height: 25,
//                 ),
//               ),
//               ActionButton(
//                 onPressed: () {
//                   print("share");
//                   // controller.share();
//                   Get.back();
//                 },
//                 icon: Image.asset(AppIcons.shareIcons),
//               ),
//               ActionButton(
//                 onPressed: controller.onTapBookMark,
//                 icon: controller.getHomeRecentlyAddedProductsModel!
//                             .data![controller.selectedIndex].bookId! ==
//                         false
//                     ? const Icon(Icons.bookmark_border)
//                     : const Icon(Icons.bookmark),
//               ),
//             ],
//           );
//   },
// ),
