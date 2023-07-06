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
    exploreController.exploreListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ExploreController());
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bgWithContainerImage),
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
                            "Popular Topic",
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
                          builder: (controller) {
                            return ListView.builder(
                                itemCount:
                                    controller.getAllCategoriesModel?.length ??
                                        0,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Container(
                                      height: 150,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(controller
                                                  .getAllCategoriesModel![index]
                                                  .pictureModel!
                                                  .imageUrl
                                                  .toString()
                                              //  AppImages.bgWithContainerImage,
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
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              ),
                                              color: Color(0XFF455077),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Text(
                                                popularTopicController
                                                    .getAllCategoriesModel![
                                                        index]
                                                    .pictureModel!
                                                    .title
                                                    .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
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
                            "Topic",
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
                            return ListView.builder(
                              itemCount: exploreController
                                      .getExploreTopicListModel?.data?.length ??
                                  0,
                              //exploreController.newsName.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        exploreController.selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      // height: 20,
                                      // width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: index ==
                                                  exploreController
                                                      .selectedIndex
                                              ? AppColors.blueColor
                                              : Colors.transparent,
                                        ),
                                        color: index ==
                                                exploreController.selectedIndex
                                            ? Colors.white
                                            : AppColors
                                                .exploreTopicContainerColor,
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
                                            //  exploreController.newsName[index],
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
                    GetBuilder<ExploreController>(
                      id: "bg",
                      builder: (exploreController) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: exploreController
                              .getHomePageProductsModel!.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return exploreList(
                              img: exploreController.getHomePageProductsModel!
                                  .data![index].pictureModels![0].imageUrl
                                  .toString(),
                              title: exploreController
                                  .getHomePageProductsModel!.data![index].seName
                                  .toString(),
                              text: exploreController.getHomePageProductsModel!
                                  .data![index].shortDescription
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
              color: Colors.white,
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
                          style: const TextStyle(fontSize: 11),
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
