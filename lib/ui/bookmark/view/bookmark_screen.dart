import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_images.dart';

import '../../../custem_class/constant/app_colors.dart';
import '../../../shared/textfild_common.dart';
import '../controller/book_mark_controller.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScrrenState();
}

class _BookmarkScrrenState extends State<BookmarkScreen> {
  BookMarkController bookMarkController = Get.find<BookMarkController>();

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.only(
            top: 35,
            left: 25,
            right: 25,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 5),
                  Image.asset(
                    AppImages.appLogo,
                    width: 60,
                  ),
                  const Spacer(),
                  const Text(
                    "Bookmark",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 21,
                      color: AppColors.blueColor,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundColor: AppColors.blueColor,
                          radius: 22,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.search,
                            color: AppColors.blueColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RequestFormTextfield(
                        formFieldType: RequestFormFieldType.search,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        controller: bookMarkController.searchController,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GetBuilder(
                  id: "bookMark",
                  builder: (BookMarkController bookMarkController) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        await Future.delayed(const Duration(milliseconds: 100));
                        bookMarkController.bookMarkListData();
                      },
                      child: bookMarkController.bookmarkLoader
                          ? const Center(child: CircularProgressIndicator())
                          : bookMarkController.bookMarkModel!.data == null
                              ? const Center(
                                  child: Text(
                                  "No Data Found",
                                  style: TextStyle(
                                    color: AppColors.blueColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))
                              : ListView.builder(
                                  itemCount: bookMarkController
                                          .bookMarkModel?.data?.items?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return bookMarkCommon(
                                      index: index,
                                      img: bookMarkController
                                              .bookMarkModel
                                              ?.data
                                              ?.items?[index]
                                              .picture
                                              ?.imageUrl ??
                                          "",
                                      title: bookMarkController
                                              .bookMarkModel
                                              ?.data
                                              ?.items?[index]
                                              .picture
                                              ?.title
                                              .toString() ??
                                          "",
                                      text: bookMarkController
                                              .bookMarkModel
                                              ?.data
                                              ?.items?[index]
                                              .picture
                                              ?.alternateText ??
                                          "",
                                      onTap: () {
                                        setState(() {
                                          bookMarkController
                                                  .bookMarkModel!
                                                  .data!
                                                  .items![index]
                                                  .picture!
                                                  .isBookMark ==
                                              !bookMarkController
                                                  .bookMarkModel!
                                                  .data!
                                                  .items![index]
                                                  .picture!
                                                  .isBookMark;
                                          // bookMarkController
                                          //         .bookMarkModel!
                                          //         .data!
                                          //         .items![index]
                                          //         .picture!
                                          //         .isBookMark
                                          //
                                          //     ///ADD BOOKMARK
                                          //     ? bookMarkController.addBookMark(
                                          //         CustomerGUID: bookMarkController
                                          //                 .bookMarkModel
                                          //                 ?.data
                                          //                 ?.customerGuid ??
                                          //             "",
                                          //         ProductId: bookMarkController
                                          //                 .bookMarkModel
                                          //                 ?.data
                                          //                 ?.items?[index]
                                          //                 .productId ??
                                          //             0,
                                          //       )
                                          //
                                          //     ///REMOVE BOOKMARK
                                          //     :
                                          bookMarkController.removeBookMark(
                                            CustomerGUID: bookMarkController
                                                    .bookMarkModel
                                                    ?.data
                                                    ?.customerGuid ??
                                                "",
                                            ItemIds: bookMarkController
                                                    .bookMarkModel
                                                    ?.data
                                                    ?.items?[index]
                                                    .productId ??
                                                0,
                                          );
                                          bookMarkController
                                              .bookMarkModel!.data!.items!
                                              .removeWhere((element) =>
                                                  element.id ==
                                                  bookMarkController
                                                      .bookMarkModel!
                                                      .data!
                                                      .items![index]
                                                      .id);
                                          bookMarkController.update();
                                        });
                                      },
                                    );
                                  }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bookMarkCommon({
    required String img,
    required String title,
    required String text,
    required void Function() onTap,
    required int index,
  }) {
    return Column(
      children: [
        Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppNightModeColor.exploreTopicListColor,
            //AppNightModeColor.white,
          ),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(img),
                    // image: AssetImage(AppImages.splashScreenImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.blueColor,
                        ),
                      ),
                      Text(
                        text,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppNightModeColor.white,
                          // AppColors.black,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: onTap,
                            child: bookMarkController.bookMarkModel!.data!
                                    .items![index].picture!.isBookMark
                                ? const Icon(
                                    Icons.bookmark_border,
                                    color: AppColors.blueColor,
                                  )
                                : const Icon(
                                    Icons.bookmark,
                                    color: AppColors.blueColor,
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
