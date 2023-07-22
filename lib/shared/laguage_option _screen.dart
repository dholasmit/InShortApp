import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';
import 'package:inshorts_newj/shared/material_button.dart';
import 'package:inshorts_newj/ui/base_screen/view/base_screen.dart';

import '../custem_class/constant/app_images.dart';
import '../ui/base_setting/controller/base_setting_controller.dart';

class LanguageOptionScreen extends StatefulWidget {
  static const String routeName = "/LanguageOptionScreen";

  const LanguageOptionScreen({Key? key}) : super(key: key);

  @override
  State<LanguageOptionScreen> createState() => _LanguageOptionScreenState();
}

class _LanguageOptionScreenState extends State<LanguageOptionScreen> {
  BaseSettingController baseSettingController =
      Get.find<BaseSettingController>();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bgWithContainerImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(
              AppImages.appLogoBig,
              width: 150,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
            const Text(
              "Choose Your Language",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.blueColor,
                fontSize: 22,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GetBuilder(
                      builder: (BaseSettingController baseSettingController) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: baseSettingController
                              .getLanguageModel2!.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return languageCommonContainer(
                              onTap: () {
                                baseSettingController.chooseLanguage = index;
                              },
                              index: index,
                              languageText:
                                  baseSettingController.languageName[index],
                              language: baseSettingController
                                  .getLanguageModel2!.data![index].name
                                  .toString(),
                            );
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 40,
                        right: 40,
                        // bottom: 220,
                      ),
                      child: materialButton(
                        onTap: () {
                          Get.toNamed(BaseScreen.routeName);
                        },
                        btnText: "Continue",
                        color: AppColors.blueColor,
                      ),
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

  languageCommonContainer({
    required int index,
    required void Function() onTap,
    required String languageText,
    required String language,
  }) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: InkWell(
          onTap: onTap,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              height: 120,
              width: Get.width,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(25),
              //   color: Colors.transparent,
              // ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$languageText !",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          language,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 17,
                          width: 17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color:
                                  baseSettingController.chooseLanguage == index
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
                                borderRadius: BorderRadius.circular(20),
                                color: baseSettingController.chooseLanguage ==
                                        index
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 10),
    ]);
  }
}
