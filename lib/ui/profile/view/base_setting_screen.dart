import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';

import '../../../custem_class/constant/app_images.dart';
import '../controller/base_setting_controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  BaseSettingController baseSettingController =
      Get.find<BaseSettingController>();

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
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: GetBuilder(
              builder: (BaseSettingController baseSettingController) {
                return ListView.builder(
                  itemCount: baseSettingController.settingIcon.length,
                  itemBuilder: (BuildContext context, int index) {
                    return settingCommonSell(
                      onTap: () {
                        baseSettingController.selectedIndex = index;
                        // showCustomDialog(context: context, children: [
                        //   Container(
                        //     color: AppColors.blueColor,
                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //         horizontal: 20,
                        //         vertical: 10,
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Image.asset(
                        //             AppIcons.languageIcons,
                        //             height: 40,
                        //           ),
                        //           const Text(
                        //             "Language",
                        //             style: TextStyle(
                        //               fontSize: 17,
                        //               fontWeight: FontWeight.w700,
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //           InkWell(
                        //             onTap: () {
                        //               Get.back();
                        //             },
                        //             child: Image.asset(AppIcons.removeIcons),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        //   RadioListTile(
                        //     title: Text("English"),
                        //     value: baseSettingController.eng,
                        //     groupValue: baseSettingController.group,
                        //     onChanged: (val) {
                        //       baseSettingController.group =
                        //           baseSettingController.eng;
                        //     },
                        //   ),
                        //   RadioListTile(
                        //     title: Text("Gujrati"),
                        //     value: baseSettingController.guj,
                        //     groupValue: baseSettingController.group,
                        //     onChanged: (val) {
                        //       baseSettingController.group =
                        //           baseSettingController.guj;
                        //     },
                        //   ),
                        //   RadioListTile(
                        //     title: Text("Hindi"),
                        //     value: baseSettingController.hindi,
                        //     groupValue: baseSettingController.group,
                        //     onChanged: (val) {
                        //       baseSettingController.group =
                        //           baseSettingController.hindi;
                        //     },
                        //   ),
                        // ]);
                      },
                      index: index,
                      ic: baseSettingController.settingIcon[index],
                      name: baseSettingController.settingName[index],
                    );
                  },
                );
              },
            ),
          )),
    );
  }

  settingCommonSell({
    required String ic,
    required String name,
    required int index,
    required void Function() onTap,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: index == baseSettingController.selectedIndex
                      ? AppColors.blueColor
                      : Colors.transparent,
                ),
                color: AppColors.settingContainerColor,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Image.asset(
                    ic,
                    height: 40,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    name,
                    style: const TextStyle(
                      color: AppColors.signupBTNColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
