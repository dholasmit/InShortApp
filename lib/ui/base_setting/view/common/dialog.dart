import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';

import '../../../../custem_class/constant/app_icons.dart';
import '../../../../custem_class/utils/globle.dart';
import '../../../../custem_class/utils/local_storage.dart';
import '../../controller/base_setting_controller.dart';

languageDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return GetBuilder(
        id: "language",
        builder: (BaseSettingController baseSettingController) {
          return Dialog(
            backgroundColor: baseSettingController.isNightMode
                ? AppColors.black
                : AppNightModeColor.white,
            insetPadding: const EdgeInsets.symmetric(horizontal: 40),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
            ), //this right herea
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              child: FittedBox(
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      Container(
                        color: AppColors.blueColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AppIcons.textSizeIcons,
                                height: 40,
                              ),
                              Text(
                                "Language",
                                style: TextStyle(
                                  // fontSize: 17,
                                  fontSize: baseSettingController.fontsStyle(
                                    defaultSize: 17,
                                    mediumSize: 20,
                                    largeSize: 23,
                                  ),
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.transparent,
                                  child: Image.asset(AppIcons.removeIcons),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: baseSettingController
                                  .getLanguageModel2?.data?.length ??
                              0,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              child: GestureDetector(
                                onTap: () {
                                  baseSettingController.chooseLanguage =
                                      // index;
                                      baseSettingController
                                          .getLanguageModel2!.data![index].id!;

                                  LocalStorage.setLanguageType(
                                      baseSettingController.chooseLanguage);
                                  debugPrint(
                                      "====================asdfhjkweryui${LocalStorage.setLanguageType(baseSettingController.chooseLanguage)}");
                                  baseSettingController
                                      .setLanguage(
                                      itemIds: baseSettingController
                                              .chooseLanguage,
                                      customerGUID: userController
                                              .userModel!.customerGuid
                                              .toString())
                                      .then(
                                        (value) => Get.back(),
                                      );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 17,
                                        width: 17,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: baseSettingController
                                                        .chooseLanguage ==
                                                    // (LocalStorage
                                                    //             .getLanguageType() ==
                                                    baseSettingController
                                                        .getLanguageModel2!
                                                        .data![index]
                                                        .id!
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Container(
                                            height: 9,
                                            width: 9,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: baseSettingController
                                                          .chooseLanguage ==
                                                      // LocalStorage.getLanguageType() ==
                                                      baseSettingController
                                                          .getLanguageModel2!
                                                          .data![index]
                                                          .id!
                                                  ? Colors.blue
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        baseSettingController.getLanguageModel2!
                                            .data![index].name!,
                                        style: TextStyle(
                                          color: AppColors.blueColor,
                                          fontSize:
                                              baseSettingController.fontsStyle(
                                            defaultSize: 15,
                                            mediumSize: 18,
                                            largeSize: 21,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

nightModeDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return GetBuilder<BaseSettingController>(
        id: "DarkLightMode",
        builder: (baseSettingController) {
          return Dialog(
            backgroundColor: baseSettingController.isNightMode
                ? AppColors.black
                : AppNightModeColor.white,
            insetPadding: const EdgeInsets.symmetric(horizontal: 40),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
            ), //this right herea
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              child: FittedBox(
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      Container(
                        color: AppColors.blueColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AppIcons.nightMOdeIcons,
                                height: 40,
                              ),
                              Text(
                                "Night Mode",
                                style: TextStyle(
                                  // fontSize: 17,
                                  fontSize: baseSettingController.fontsStyle(
                                    defaultSize: 17,
                                    mediumSize: 20,
                                    largeSize: 23,
                                  ),
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.transparent,
                                  child: Image.asset(AppIcons.removeIcons),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: baseSettingController.modeList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              child: GestureDetector(
                                ///
                                onTap: () {
                                  baseSettingController.chooseModeList = index;
                                  LocalStorage.intSetLightDarkMode(
                                      baseSettingController.chooseModeList);

                                  index == 0
                                      ? LocalStorage.setLightDarkMode(
                                          baseSettingController.setIsNightMode =
                                              false,
                                        )
                                      : index == 1
                                          ? LocalStorage.setLightDarkMode(
                                              baseSettingController
                                                  .setIsNightMode = true,
                                            )
                                          : const SizedBox();
                                  Get.back();
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 17,
                                        width: 17,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: LocalStorage
                                                        .intGetLightDarkMode() ==
                                                    index
                                                // baseSettingController
                                                //     .chooseModeList ==
                                                // index
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Container(
                                            height: 9,
                                            width: 9,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: LocalStorage
                                                          .intGetLightDarkMode() ==
                                                      index
                                                  ? Colors.blue
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        baseSettingController.modeList[index],
                                        style: TextStyle(
                                          color: AppColors.blueColor,
                                          fontSize:
                                              baseSettingController.fontsStyle(
                                            defaultSize: 15,
                                            mediumSize: 18,
                                            largeSize: 21,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

textSizeDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return GetBuilder(
        id: "DarkLightMode",
        builder: (BaseSettingController baseSettingController) {
          return Dialog(
            backgroundColor: baseSettingController.isNightMode
                ? AppColors.black
                : AppNightModeColor.white,
            insetPadding: const EdgeInsets.symmetric(horizontal: 40),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
            ), //this right herea
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              child: FittedBox(
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      Container(
                        color: AppColors.blueColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AppIcons.textSizeIcons,
                                height: 40,
                              ),
                              Text(
                                "Text Size",
                                style: TextStyle(
                                  fontSize: baseSettingController.fontsStyle(
                                    defaultSize: 17,
                                    mediumSize: 20,
                                    largeSize: 23,
                                  ),
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.transparent,
                                  child: Image.asset(AppIcons.removeIcons),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: baseSettingController.fontSize.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              child: GestureDetector(
                                onTap: () {
                                  baseSettingController.chooseFontSize = index;
                                  LocalStorage.setFontSize(
                                      baseSettingController.chooseFontSize);
                                  Get.back();
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 17,
                                        width: 17,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: baseSettingController
                                                        .chooseFontSize ==
                                                    index
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Container(
                                            height: 9,
                                            width: 9,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: baseSettingController
                                                          .chooseFontSize ==
                                                      index
                                                  ? Colors.blue
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        baseSettingController.fontSize[index],
                                        style: TextStyle(
                                          color: AppColors.blueColor,
                                          fontSize:
                                              baseSettingController.fontsStyle(
                                            defaultSize: 15,
                                            mediumSize: 18,
                                            largeSize: 21,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
