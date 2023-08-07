import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_icons.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../shared/floting_action_btn.dart';
import '../controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  floatingActionButton: FoldableOptions(),

      floatingActionButton: GetBuilder<HomeScreenController>(
        id: "flot",
        builder: (controller) {
          print("flot ==> ${controller.flotClose}");
          return controller.loader
              ? const Center(child: SizedBox())
              : ExpandableFab(
                  distance: 60.0,
                  initialOpen: controller.flotClose,
                  children: [
                    ActionButton(
                      onPressed: () {
                        print("share");
                        // controller.share();
                        Get.back();
                      },
                      icon: Image.asset(AppIcons.shareIcons),
                    ),
                    ActionButton(
                      onPressed: controller.onTapBookMark,
                      icon: controller.getHomeRecentlyAddedProductsModel!
                                  .data![controller.selectedIndex].bookId! ==
                              false
                          ? const Icon(Icons.bookmark_border)
                          : const Icon(Icons.bookmark),
                    ),
                    // ActionButton(
                    //   onPressed: () {
                    //     print("liked");
                    //   },
                    //   icon: Image.asset(AppIcons.likeIcons),
                    // ),
                  ],
                );
        },
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bgWithContainerImage),
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
                    scrollDirection: Axis.horizontal,
                    onIndexChanged: controller.inChangeIndex,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 25,
                          top: 35,
                        ),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
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
                                const SizedBox(height: 10),
                                Expanded(
                                  child: SingleChildScrollView(
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
