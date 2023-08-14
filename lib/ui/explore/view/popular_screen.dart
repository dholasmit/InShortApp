import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';

import '../../../custem_class/constant/app_images.dart';
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

  @override
  void initState() {
    popularTopicController.popularData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(PopularTopicController());
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
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
                                                  .getAllCategoriesModel![index]
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
                                              .getAllCategoriesModel![index]
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
                              );
                            });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
