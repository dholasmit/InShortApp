import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/ui/bookmark/controller/book_mark_controller.dart';

import '../../../custem_class/utils/globle.dart';
import '../../../models/bookmark/addbookmark_model.dart';
import '../../../models/home/recently_added_products_model.dart';
import '../../../services/bookmark/bookmark_repo.dart';
import '../../../services/home/home_screen_repo.dart';

class HomeScreenController extends GetxController {
  BookMarkController bookMarkController = Get.find<BookMarkController>();
  HomeRecentlyAddedProductsModel? _homeRecentlyAddedProductsModel;

  HomeRecentlyAddedProductsModel? get getHomeRecentlyAddedProductsModel =>
      _homeRecentlyAddedProductsModel;

  set setHomeRecentlyAddedProductsModel(HomeRecentlyAddedProductsModel? value) {
    _homeRecentlyAddedProductsModel = value;
    update();
  }

  bool loader = false;
  bool flotClose = false;
  bool pageFirst = false;
  bool pageEnd = false;
  int selectedIndex = 0;
  int prevIndex = 0;
  int page = 1;
  SwiperController pageController = SwiperController();

  Future<void> homeRecentlyAddedProductsData({int? pageIndex}) async {
    loader = true;
    update(["flot", "product"]);
    if (pageIndex == null) {
      setHomeRecentlyAddedProductsModel =
          await HomeScreenApi.homeRecentlyAddedProducts(page: 1);
    } else {
      HomeRecentlyAddedProductsModel data =
          await HomeScreenApi.homeRecentlyAddedProducts(page: pageIndex);
      _homeRecentlyAddedProductsModel!.data!.addAll(data.data!);
    }
    loader = false;
    update(["flot", "product"]);
  }

  Future<void> onChangeIndex(int index) async {
    if (selectedIndex == (page * 10) - 2 && prevIndex < selectedIndex) {
      page = page + 1;
      await homeRecentlyAddedProductsData(pageIndex: page);
      pageController.move(index, animation: false);
    }
    prevIndex = selectedIndex;
    selectedIndex = index;
    flotClose = false;
    debugPrint("Index==> $selectedIndex");
    update(["flot", "product"]);
  }

  /// BookMark & UnBookMark
  Future<void> onTapBookMark() async {
    bool isBook =
        getHomeRecentlyAddedProductsModel!.data![selectedIndex].markAsNew!;

    getHomeRecentlyAddedProductsModel!.data![selectedIndex].markAsNew = !isBook;
    int id = getHomeRecentlyAddedProductsModel!.data![selectedIndex].id!;
    if (isBook == false) {
      await addBookMark(productId: id);
      update(["flot", "product"]);
    } else {
      removeBookMarkData();
      update(["flot", "product"]);
    }
  }

  /// Add BookMark
  Future<void> addBookMark({
    required int productId,
  }) async {
    AddBookMarkModel? addBookMarkModel = await BookmarkApi.addBookmarkRepo(
      customerGUID: userController.userModel!.customerGuid.toString(),
      productId: productId,
    );

    if (addBookMarkModel != null) {
      return;
    }
  }

  /// removeBook Mark API
  removeBookMarkData() {
    return bookMarkController.removeBookMark(
      customerGUID: bookMarkController.bookMarkModel?.data?.customerGuid ?? "",
      itemIds: getHomeRecentlyAddedProductsModel!.data![selectedIndex].id!,
    );
  }

  /// ShareLink
  Future<void> share({required String link}) async {
    await FlutterShare.share(
      title: 'In-ShortApp',
      linkUrl: link,
      // linkUrl: 'app link attached',
    );
  }

  @override
  void onInit() {
    homeRecentlyAddedProductsData();
    super.onInit();
  }
//   void inChangeIndex(int index) {
//     if (getHomeRecentlyAddedProductsModel!.data!.isEmpty && pageEnd) {
//       page = 1;
//       homeRecentlyAddedProductsData();
//     } else if (pageEnd) {
//       page++;
//       homeRecentlyAddedProductsData();
//       return;
//     }
//     if (getHomeRecentlyAddedProductsModel!.data!.isEmpty) {
//       pageEnd = false;
//     } else if (index + 1 == getHomeRecentlyAddedProductsModel!.data!.length) {
//       pageEnd = true;
//     } else if (getHomeRecentlyAddedProductsModel!.data!.isNotEmpty ||
//         index == 0) {
//       pageFirst = true;
//     } else {
//       pageFirst = false;
//       pageEnd = false;
//     }
//     // if (getHomeRecentlyAddedProductsModel!.data!.isEmpty) {
//     //   page;
//     //   pageEnd = false;
//     // } else if (index + 1 == getHomeRecentlyAddedProductsModel!.data!.length) {
//     //   pageEnd = true;
//     // } else if (getHomeRecentlyAddedProductsModel!.data!.isNotEmpty || index == 0) {
//     //   pageFirst = true;
//     // } else {
//     //   pageFirst = false;
//     //   pageEnd = false;
//     // }
// //////////////////////////////////////////////////////////////
//     // if (pageEnd) {
//     //   page++;
//     //   homeRecentlyAddedProductsData();
//     //   return;
//     // }
//     // if (index + 1 == getHomeRecentlyAddedProductsModel!.data!.length) {
//     //   pageEnd = true;
//     // } else if (index == 0) {
//     //   pageFirst = true;
//     // } else {
//     //   pageFirst = false;
//     //   pageEnd = false;
//     // }
//     selectedIndex = index;
//     flotClose = false;
//     print("Index==> $selectedIndex");
//     update(["flot", "product"]);
//   }
}
