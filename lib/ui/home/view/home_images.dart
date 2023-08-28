import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_images.dart';
import '../../../custem_class/utils/local_storage.dart';

class HomeScreenImages extends StatefulWidget {
  static const String routeName = "/HomeScreenImages";

  const HomeScreenImages({Key? key}) : super(key: key);

  @override
  State<HomeScreenImages> createState() => _HomeScreenImagesState();
}

class _HomeScreenImagesState extends State<HomeScreenImages> {
  var img = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              LocalStorage.getLightDarkMode()
                  ? AppNightModeImage.bgWithContainerImageNightMode
                  : AppImages.bgWithContainerImage,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            // left: 20,
            // right: 20,
            // bottom: 25,
            //top: 35,
            top: 60,
          ),
          child: Center(
            child: InteractiveViewer(
              //boundaryMargin: const EdgeInsets.all(20.0),
              minScale: 0.1,
              maxScale: 10,
              clipBehavior: Clip.none,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        img,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.cancel_outlined,
                          size: 30,
                          color: AppColors.blueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
