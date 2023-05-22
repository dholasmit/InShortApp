import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../custem_class/constant/app_icons.dart';
import '../../../custem_class/constant/app_images.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = "/NotificationScreen";

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.blueColor,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Notifications",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 21,
                      color: AppColors.blueColor,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      AppIcons.notificationSettingsIcons,
                    ),
                  ),
                  const SizedBox(width: 25),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Show all",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Mark all as read",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
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
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return SwipeActionCell(
                        key: UniqueKey(),
                        backgroundColor: Colors.transparent,
                        // key: ObjectKey(list[index]),
                        trailingActions: <SwipeAction>[
                          SwipeAction(
                            title: "delete",
                            icon: const Icon(Icons.delete),
                            onTap: (CompletionHandler handler) async {
                              await handler(true);
                              // data.removeAt;
                              setState(() {});
                            },
                            color: Colors.red,
                          ),
                          SwipeAction(
                            title: "Read",
                            icon: const Icon(Icons.chrome_reader_mode),
                            onTap: (CompletionHandler handler) async {
                              await handler(true);

                              /// commit for my side
                              // data.removeAt;
                              setState(() {});
                            },
                            color: Colors.blue,
                          ),
                        ],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          "https://i.timesnowhindi.com/stories/Virat-Kohli-First-T20I-Century.jpg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "For 12 years, Bavo spoke:",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.blueColor,
                                        ),
                                      ),
                                      Text(
                                        "Make Bharuch Manpa, After 2011, again in 2023 presentation before the Chief Minister  regarding Maha Nagar Palika Make Bharuch Manpa, After 2011, again in 2023 presentation before the Chief Minister regarding Maha Nagar Palika",
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          )

          // child: Padding(
          //   padding: const EdgeInsets.only(top: 40, bottom: 10),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           IconButton(
          //             onPressed: () {
          //               Get.back();
          //             },
          //             icon: const Icon(
          //               Icons.arrow_back_ios_new,
          //               color: AppColors.blueColor,
          //             ),
          //           ),
          //           const Spacer(),
          //           const Text(
          //             "Notifications",
          //             style: TextStyle(
          //               fontWeight: FontWeight.w700,
          //               fontSize: 21,
          //               color: AppColors.blueColor,
          //             ),
          //           ),
          //           const Spacer(),
          //           InkWell(
          //             onTap: () {},
          //             child: Image.asset(
          //               AppIcons.notificationSettingsIcons,
          //             ),
          //           ),
          //           const SizedBox(width: 25),
          //         ],
          //       ),
          //       const SizedBox(height: 20),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 20),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: const [
          //             Text(
          //               "Show all",
          //               style: TextStyle(
          //                 fontWeight: FontWeight.w500,
          //                 fontSize: 12,
          //               ),
          //             ),
          //             Text(
          //               "Mark all as read",
          //               style: TextStyle(
          //                 fontWeight: FontWeight.w500,
          //                 fontSize: 12,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 10),
          //         child: Divider(
          //           thickness: 2,
          //           color: Colors.white,
          //         ),
          //       ),
          //       Expanded(
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           child: ListView.builder(
          //             itemCount: 10,
          //             itemBuilder: (context, index) {
          //               return Column(
          //                 children: [
          //                   Dismissible(
          //                     key: UniqueKey(),
          //                     background: Align(
          //                       alignment: Alignment.centerLeft,
          //                       heightFactor: 10.0,
          //                       widthFactor: 10.0,
          //                       child: Row(
          //                         mainAxisAlignment: MainAxisAlignment.end,
          //                         children: [
          //                           IconButton(
          //                             onPressed: () {},
          //                             icon: const Icon(Icons.save),
          //                           ),
          //                           IconButton(
          //                             onPressed: () {},
          //                             icon: const Icon(Icons.delete),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     direction: DismissDirection.endToStart,
          //                     child: Container(
          //                       height: 100,
          //                       width: double.infinity,
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10),
          //                         color: Colors.white,
          //                       ),
          //                       child: Row(
          //                         children: [
          //                           Padding(
          //                             padding: const EdgeInsets.all(4.0),
          //                             child: Container(
          //                               height: 100,
          //                               width: 100,
          //                               decoration: BoxDecoration(
          //                                 borderRadius: BorderRadius.circular(10),
          //                                 image: const DecorationImage(
          //                                   image: NetworkImage(
          //                                     "https://i.timesnowhindi.com/stories/Virat-Kohli-First-T20I-Century.jpg",
          //                                   ),
          //                                   fit: BoxFit.cover,
          //                                 ),
          //                               ),
          //                             ),
          //                           ),
          //                           const SizedBox(width: 10),
          //                           Expanded(
          //                             child: Column(
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                               children: const [
          //                                 Text(
          //                                   "For 12 years, Bavo spoke:",
          //                                   style: TextStyle(
          //                                     fontSize: 14,
          //                                     fontWeight: FontWeight.w700,
          //                                     color: AppColors.blueColor,
          //                                   ),
          //                                 ),
          //                                 Text(
          //                                   "Make Bharuch Manpa, After 2011, again in 2023 presentation before the Chief Minister  regarding Maha Nagar Palika Make Bharuch Manpa, After 2011, again in 2023 presentation before the Chief Minister regarding Maha Nagar Palika",
          //                                   maxLines: 3,
          //                                   style: TextStyle(
          //                                     fontSize: 12,
          //                                     fontWeight: FontWeight.w400,
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                   const SizedBox(height: 10),
          //                 ],
          //               );
          //             },
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
