import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_colors.dart';
import 'package:inshorts_newj/custem_class/constant/app_icons.dart';
import 'package:inshorts_newj/custem_class/utils/local_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/home/controller/home_screen_controller.dart';

class FoldableOptions extends StatefulWidget {
  @override
  _FoldableOptionsState createState() => _FoldableOptionsState();
}

class _FoldableOptionsState extends State<FoldableOptions>
    with SingleTickerProviderStateMixin {
  bool isTapped = true;
  bool isExpanded = false;
  final List<String> options = [
    AppIcons.bookMarkIcons,
    AppIcons.shareIcons,
    AppIcons.browserIcons,
  ];

  late Animation<Alignment> firstAnim;
  late Animation<Alignment> secondAnim;
  late Animation<Alignment> thirdAnim;
  late Animation<double> verticalPadding;
  late AnimationController animationController;
  final duration = const Duration(milliseconds: 190);

  Widget floatingActionTypeButtonItem({
    required String img,
    required void Function() onTap,
  }) {
    const size = 40.0;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: LocalStorage.getLightDarkMode() ? Colors.black : Colors.white,
          border: Border.all(color: AppColors.blueColor, width: 1.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Image.asset(
          img,
          color: AppColors.blueColor,
          height: 20,
        ),

        // Icon(
        //   ic,
        //   color: AppColors.blueColor,
        //   size: 20,
        // ),
      ),
    );
  }

  Widget floatingActionTypeButton({required IconData ic}) {
    const size = 45.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: LocalStorage.getLightDarkMode() ? Colors.black : Colors.white,
        border: Border.all(color: AppColors.blueColor, width: 1.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Icon(
        ic,
        color: AppColors.blueColor,
        size: 20,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: duration);

    final anim =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    firstAnim =
        Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topRight)
            .animate(anim);
    secondAnim =
        Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topLeft)
            .animate(anim);
    thirdAnim = Tween<Alignment>(
            begin: Alignment.bottomRight, end: Alignment.bottomLeft)
        .animate(anim);
    verticalPadding = Tween<double>(begin: 0, end: 26).animate(anim);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      id: "flot",
      builder: (homeScreenController) {
        return homeScreenController.loader
            ? const SizedBox()
            : Container(
                width: 130,
                height: 120,
                margin: const EdgeInsets.only(right: 10, bottom: 10),
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Stack(
                      children: <Widget>[
                        Align(
                          alignment: firstAnim.value,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: floatingActionTypeButtonItem(
                              onTap: () {
                                print("BookMark Icon");
                                homeScreenController.onTapBookMark();
                                animationController.reverse();
                              },
                              img: homeScreenController
                                          .getHomeRecentlyAddedProductsModel!
                                          .data![homeScreenController
                                              .selectedIndex]
                                          .markAsNew! ==
                                      false
                                  ? AppIcons.unBookMarkIcons
                                  : AppIcons.bookMarkIcons,
                            ),
                          ),
                        ),
                        Align(
                          alignment: secondAnim.value,
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 40,
                              top: verticalPadding.value,
                              //  top: 30,
                            ),
                            child: floatingActionTypeButtonItem(
                              onTap: () {
                                print("Share Icon");
                                animationController.reverse();
                              },
                              img: options.elementAt(1),
                            ),
                          ),
                        ),
                        Align(
                          alignment: secondAnim.value,
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 30,
                              top: 80,
                              //top: verticalPadding.value,
                            ),
                            child: floatingActionTypeButtonItem(
                              onTap: () {
                                print("Web Icon");
                                print(
                                  "PRODUCT URL ============>${homeScreenController.getHomeRecentlyAddedProductsModel!.data![homeScreenController.selectedIndex].prouductUrl!}",
                                );
                                launch(homeScreenController
                                    .getHomeRecentlyAddedProductsModel!
                                    .data![homeScreenController.selectedIndex]
                                    .prouductUrl!
                                    .toString());
                                animationController.reverse();
                              },
                              img: options.elementAt(2),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              animationController.isCompleted
                                  ? animationController.reverse()
                                  : animationController.forward();
                            },
                            child: floatingActionTypeButton(
                              ic: animationController.isCompleted ||
                                      animationController.isAnimating
                                  ? Icons.close
                                  : Icons.add,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
      },
    );
  }
}
