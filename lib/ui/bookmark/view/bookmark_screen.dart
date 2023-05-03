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
            image: AssetImage(AppImages.bgWithContainerImage),
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder(
          builder: (BookMarkController bookMarkController) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 35,
                left: 25,
                right: 25,
              ),
              child: Column(
                children: [
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
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return bookMarkCommon(
                            img: AppImages.splashScreenImage,
                            title: "Obama meets PM Modi in Delhi :",
                            text:
                                "Make Bharuch Manpa, After 2011, again in 2023 presentation before the Chief Minister regarding Maha Nagar Palika",
                            onTap: () {},
                          );
                        }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bookMarkCommon({
    required String img,
    required String title,
    required String text,
    required void Function() onTap,
  }) {
    return Column(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                //height: 100,
                margin: const EdgeInsets.all(5),
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(img),
                    // image: AssetImage(AppImages.splashScreenImage),
                    fit: BoxFit.cover,
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
                      Text(
                        title,
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
                        style: const TextStyle(fontSize: 12),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: onTap,
                            child: const Icon(
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
