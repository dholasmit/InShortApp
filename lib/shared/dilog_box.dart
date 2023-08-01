import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/shared/material_button.dart';

import '../custem_class/constant/app_colors.dart';
import '../custem_class/constant/app_icons.dart';
import '../ui/base_setting/controller/base_setting_controller.dart';

BaseSettingController baseSettingController = Get.find<BaseSettingController>();

dialog({
  required BuildContext context,
  required String ic,
  required String title,
  required String txt1,
  required String value1,
  required String groupValue1,
  required void Function(String?) onChanged1,
  required String txt2,
  required String value2,
  required String groupValue2,
  required void Function(String?) onChanged2,
  required String txt3,
  required String value3,
  required String groupValue3,
  required void Function(String?) onChanged3,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return GetBuilder(
        id: "dialog",
        builder: (BaseSettingController baseSettingController) {
          return Dialog(
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
                                ic,
                                height: 40,
                              ),
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 17,
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
                      RadioListTile(
                        title: Text(
                          txt1,
                          style: const TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: value1,
                        groupValue: groupValue1,
                        onChanged: onChanged1,
                      ),
                      RadioListTile(
                        title: Text(
                          txt2,
                          style: const TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: value2,
                        groupValue: groupValue2,
                        onChanged: (value) {},
                      ),
                      RadioListTile(
                        title: Text(
                          txt3,
                          style: const TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: value3,
                        groupValue: groupValue3,
                        onChanged: onChanged3,
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

dialog2({
  required BuildContext context,
  required String ic,
  required String title,
  required String txt1,
  required String value1,
  required String groupValue1,
  required void Function(String?) onChanged1,
  required String txt2,
  required String value2,
  required String groupValue2,
  required void Function(String?) onChanged2,
  required String txt3,
  required String value3,
  required String groupValue3,
  required void Function(String?) onChanged3,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return GetBuilder(
        id: "dialog",
        builder: (BaseSettingController baseSettingController) {
          return Dialog(
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
                                ic,
                                height: 40,
                              ),
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 17,
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
                      RadioListTile(
                        title: Text(
                          txt1,
                          style: const TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: value1,
                        groupValue: groupValue1,
                        onChanged: onChanged1,
                      ),
                      RadioListTile(
                        title: Text(
                          txt2,
                          style: const TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: value2,
                        groupValue: groupValue2,
                        onChanged: onChanged2,
                      ),
                      RadioListTile(
                        title: Text(
                          txt3,
                          style: const TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: value3,
                        groupValue: groupValue3,
                        onChanged: onChanged3,
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

logOutDialog(
  BuildContext context, {
  required String ic,
  required String title,
  required void Function() onPressed,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return GetBuilder(
        builder: (BaseSettingController baseSettingController) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ), //this right herea
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
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
                                ic,
                                height: 40,
                              ),
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Image.asset(AppIcons.removeIcons),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "Are You sure Want to log out?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: materialButton(
                                onTap: () {
                                  Get.back();
                                },
                                btnText: "Cancel",
                                color: AppColors.blueColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: materialBorderButton(
                                context,
                                onPressed: onPressed,
                                txt: "Logout",
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
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

cameraDialog(
  BuildContext context, {
  required String ic,
  required String title,
  required String txt,
  required void Function() onPressedCamera,
  required void Function() onPressedGallery,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return GetBuilder(
        builder: (BaseSettingController baseSettingController) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ), //this right herea
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
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
                                ic,
                                //height: 40,
                                color: Colors.white,
                              ),
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Image.asset(AppIcons.removeIcons),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        txt,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: materialButton(
                                onTap: onPressedCamera,
                                btnText: "Camera",
                                color: AppColors.blueColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: materialBorderButton(
                                context,
                                onPressed: onPressedGallery,
                                txt: "Gallery",
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
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
