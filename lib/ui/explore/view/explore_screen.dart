import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/ui/explore/controller/popular_topic_controller.dart';
import 'package:inshorts_newj/ui/explore/view/popular_screen.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_icons.dart';
import '../../../custem_class/constant/app_images.dart';
import '../controller/explore_controller.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ExploreController exploreController = Get.find<ExploreController>();
  PopularTopicController popularTopicController =
      Get.find<PopularTopicController>();

  @override
  void initState() {
    //  exploreController.exploreListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(ExploreController());
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppNightModeImage.bgWithContainerImageNightMode,
              // AppImages.bgWithContainerImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 25),
                Image.asset(
                  AppImages.appLogo,
                  width: 60,
                ),
                const Spacer(),
                const Text(
                  "Explore",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 21,
                    color: AppColors.blueColor,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppIcons.exploreNotificationIcons,
                    width: 25,
                  ),
                ),
                const SizedBox(width: 25),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Popular Category",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.blueColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(PopularScreen.routeName);
                            },
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppNightModeColor.white
                                  // AppColors.black,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 140,
                        color: Colors.transparent,
                        child: GetBuilder<PopularTopicController>(
                          builder: (popularTopicController) {
                            return popularTopicController.popularLoader
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.builder(
                                    itemCount: popularTopicController
                                        .getAllCategoriesModel!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Container(
                                          height: 150,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                popularTopicController
                                                    .getAllCategoriesModel![
                                                        index]
                                                    .pictureModel!
                                                    .imageUrl
                                                    .toString(),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              const Spacer(),
                                              Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                  ),
                                                  color: Color(0XFF455077),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                  ),
                                                  child: Text(
                                                    popularTopicController
                                                        .getAllCategoriesModel![
                                                            index]
                                                        .name
                                                        .toString(),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Category",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.blueColor,
                            ),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppNightModeColor.white
                                // AppColors.black,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 30,
                        color: Colors.transparent,
                        child: GetBuilder<ExploreController>(
                          builder: (exploreController) {
                            return
                                // exploreController.exploreLoader
                                //   ? const Center(
                                //       child: CircularProgressIndicator())
                                //   :
                                ListView.builder(
                              itemCount: exploreController
                                      .getExploreTopicListModel?.data?.length ??
                                  0,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        exploreController.selectedIndex = index;
                                        print(
                                          exploreController
                                              .getExploreTopicListModel!
                                              .data![index]
                                              .id
                                              .toString(),
                                        );
                                        exploreController
                                            .getProductsByCategoryList(
                                                id: exploreController
                                                    .getExploreTopicListModel!
                                                    .data![index]
                                                    .id!);
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: index ==
                                                  exploreController
                                                      .selectedIndex
                                              ? AppColors.blueColor
                                              : Colors.transparent,
                                        ),

                                        ///tap color
                                        color: AppColors.black,
                                        // color: index ==
                                        //         exploreController.selectedIndex
                                        //     ? Colors.white
                                        //     : AppColors
                                        //         .exploreTopicContainerColor,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Text(
                                            exploreController
                                                .getExploreTopicListModel!
                                                .data![index]
                                                .name
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.blueColor,
                                            ),
                                          ),
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
                    ),
                    const SizedBox(height: 15),
                    GetBuilder(
                      id: "GetProductsByCategory",
                      builder: (ExploreController exploreController) {
                        return exploreController.exploreLoader
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: exploreController
                                    .getProductsByCategoryModel!.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return exploreList(
                                    img: exploreController
                                        .getProductsByCategoryModel!
                                        .data![index]
                                        .pictureModels![0]
                                        .imageUrl
                                        .toString(),
                                    title: exploreController
                                        .getProductsByCategoryModel!
                                        .data![index]
                                        .productName
                                        .toString(),
                                    text: exploreController
                                        .getProductsByCategoryModel!
                                        .data![index]
                                        .shortDescription
                                        .toString(),
                                    onTap: () {},
                                  );
                                },
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  exploreList({
    required String img,
    required String title,
    required String text,
    required void Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            //height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppNightModeColor.exploreTopicListColor,
              //AppNightModeColor.white,
            ),
            child: Row(
              children: [
                Container(
                  height: 100,
                  margin: const EdgeInsets.all(5),
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(img),
                      // image: AssetImage(AppImages.splashScreenImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppColors.blueColor,
                          ),
                        ),
                        Text(
                          text,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontSize: 11, color: AppNightModeColor.white,
                            // AppColors.black,
                          ),
                        ),

                        /// const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
