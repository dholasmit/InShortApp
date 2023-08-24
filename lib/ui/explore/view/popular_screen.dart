import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';
import 'package:inshorts_newj/ui/explore/controller/explore_controller.dart';

import '../../../custem_class/constant/app_images.dart';
import '../../../custem_class/utils/local_storage.dart';
import '../../base_setting/controller/base_setting_controller.dart';
import '../../home/view/home_popular_topic_screen_data.dart';
import '../controller/popular_topic_controller.dart';

class PopularScreen extends StatefulWidget {
  static const String routeName = "/PopularScreen";

  const PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  PopularTopicController popularTopicController =
      Get.find<PopularTopicController>();
  BaseSettingController baseSettingController =
      Get.find<BaseSettingController>();
  ExploreController exploreController = Get.find<ExploreController>();

  @override
  void initState() {
    popularTopicController.popularData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(PopularTopicController());
    return Scaffold(
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
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: AppColors.blueColor,
                          // AppColors.black,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Popular Topic",
                        style: TextStyle(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 21,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GetBuilder<PopularTopicController>(
                      id: "popularData",
                      builder: (popularTopicController) {
                        return popularTopicController.popularLoader
                            ? const Center(child: CircularProgressIndicator())
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.9 / 1.5,
                                ),
                                itemCount: popularTopicController
                                    .getAllCategoriesModel!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        print("index======>$index");
                                        exploreController
                                            .getProductsByCategoryList(
                                                id: popularTopicController
                                                    .getAllCategoriesModel![
                                                        index]
                                                    .id!)
                                            .then((value) => {
                                                  Get.toNamed(
                                                    HomePopularTopicData
                                                        .routeName,
                                                    arguments:
                                                        popularTopicController
                                                            .getAllCategoriesModel![
                                                                index]
                                                            .name
                                                            .toString(),
                                                  ),
                                                });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.transparent,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 130,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    popularTopicController
                                                        .getAllCategoriesModel![
                                                            index]
                                                        .pictureModel!
                                                        .imageUrl
                                                        .toString(),
                                                  ),
                                                  // image: AssetImage(img[index]),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            // const SizedBox(height: 5),
                                            Expanded(
                                              child: Text(
                                                popularTopicController
                                                    .getAllCategoriesModel![
                                                        index]
                                                    .name
                                                    .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.blueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
