import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';

import '../../../custem_class/constant/app_images.dart';

class PopularScreen extends StatefulWidget {
  static const String routeName = "/PopularScreen";

  const PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  List<String> img = [
    AppImages.splashScreenImage,
    AppImages.bgWithContainerImage,
    AppImages.splashScreenImage,
    AppImages.bgWithContainerImage,
    AppImages.splashScreenImage,
    AppImages.bgWithContainerImage,
    AppImages.splashScreenImage,
    AppImages.bgWithContainerImage,
    AppImages.splashScreenImage,
    AppImages.bgWithContainerImage,
    AppImages.splashScreenImage,
  ];

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
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
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.3 / 1.5,
                    ),
                    itemCount: img.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(img[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
