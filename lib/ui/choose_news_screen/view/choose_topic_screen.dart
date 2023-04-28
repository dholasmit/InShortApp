import 'package:flutter/material.dart';
import 'package:inshorts_newj/shared/material_button.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_images.dart';

class ChooseTopicScreen extends StatefulWidget {
  static const String routeName = "/ChooseTopicScreen";

  const ChooseTopicScreen({Key? key}) : super(key: key);

  @override
  State<ChooseTopicScreen> createState() => _ChooseTopicScreenState();
}

class _ChooseTopicScreenState extends State<ChooseTopicScreen> {
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
          padding: const EdgeInsets.only(
            top: 40,
            // left: 25,
            // right: 25,
            bottom: 10,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.appLogo,
                      height: 40,
                    ),
                    const Spacer(),
                    MaterialButton(
                      minWidth: 35,
                      height: 20,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppColors.signupBTNColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          color: AppColors.signupBTNColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        const Text(
                          "Choose a Topic To Start Reading.",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                            color: AppColors.blueColor,
                          ),
                        ),
                        GridView.builder(
                            itemCount: 12,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 100,
                              childAspectRatio: 2 / 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print("Demo");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.choseTopicRoundColor,
                                      width: 2,
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    image: const DecorationImage(
                                      image: AssetImage(AppImages.googleIcon),
                                      // scale: 2
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 70),
                                      child: Text(
                                        "Demo",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                        const SizedBox(height: 50),
                        materialButton(
                          onTap: () {},
                          btnText: "Continue",
                          color: AppColors.blueColor,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
