import 'package:flutter_share/flutter_share.dart';
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
  int page = 1;

  Future<void> homeRecentlyAddedProductsData() async {
    loader = true;
    update(["flot", "product"]);
    setHomeRecentlyAddedProductsModel =
        await HomeScreenApi.homeRecentlyAddedProducts(page: page);
    // loader = false;
    if (getHomeRecentlyAddedProductsModel!.data!.isNotEmpty) {
      pageEnd = false;
    } else {
      pageEnd = true;
    }
    loader = false;

    // pageEnd = false;
    update(["flot", "product"]);
  }

  Future<void> onTapBookMark() async {
    bool isBook =
        getHomeRecentlyAddedProductsModel!.data![selectedIndex].bookId!;

    getHomeRecentlyAddedProductsModel!.data![selectedIndex].bookId = !isBook;
    int id = getHomeRecentlyAddedProductsModel!.data![selectedIndex].id!;
    if (isBook == false) {
      await addBookMark(productId: id);
      update(["flot", "product"]);
    } else {
      removeBookMarkData();
      update(["flot", "product"]);
    }
  }

  void inChangeIndex(int index) {
    if (getHomeRecentlyAddedProductsModel!.data!.isEmpty && pageEnd) {
      page = 1;
      homeRecentlyAddedProductsData();
    } else if (pageEnd) {
      page++;
      homeRecentlyAddedProductsData();
      return;
    }
    if (getHomeRecentlyAddedProductsModel!.data!.isEmpty) {
      page;
      pageEnd = false;
    } else if (index + 1 == getHomeRecentlyAddedProductsModel!.data!.length) {
      pageEnd = true;
    } else if (getHomeRecentlyAddedProductsModel!.data!.isNotEmpty ||
        index == 0) {
      pageFirst = true;
    } else {
      pageFirst = false;
      pageEnd = false;
    }
    // if (getHomeRecentlyAddedProductsModel!.data!.isEmpty) {
    //   page;
    //   pageEnd = false;
    // } else if (index + 1 == getHomeRecentlyAddedProductsModel!.data!.length) {
    //   pageEnd = true;
    // } else if (getHomeRecentlyAddedProductsModel!.data!.isNotEmpty || index == 0) {
    //   pageFirst = true;
    // } else {
    //   pageFirst = false;
    //   pageEnd = false;
    // }
//////////////////////////////////////////////////////////////
    // if (pageEnd) {
    //   page++;
    //   homeRecentlyAddedProductsData();
    //   return;
    // }
    // if (index + 1 == getHomeRecentlyAddedProductsModel!.data!.length) {
    //   pageEnd = true;
    // } else if (index == 0) {
    //   pageFirst = true;
    // } else {
    //   pageFirst = false;
    //   pageEnd = false;
    // }
    selectedIndex = index;
    flotClose = false;
    print("Index==> $selectedIndex");
    update(["flot", "product"]);
  }

  /// Add BookMark
  Future<void> addBookMark({
    required int productId,
  }) async {
    AddBookMarkModel? addBookMarkModel = await BookmarkApi.addBookmarkRepo(
      CustomerGUID: userController.userModel!.customerGuid.toString(),
      ProductId: productId,
    );

    if (addBookMarkModel != null) {
      return;
    }
  }

  /// removeBook Mark API
  removeBookMarkData() {
    return bookMarkController.removeBookMark(
      CustomerGUID: bookMarkController.bookMarkModel?.data?.customerGuid ?? "",
      ItemIds: getHomeRecentlyAddedProductsModel!.data![selectedIndex].id!,
    );
  }

  /// App share
  Future<void> share() async {
    await FlutterShare.share(
      title: 'In-ShortApp',
      linkUrl: 'app link attached',
    );
  }

  @override
  void onInit() {
    homeRecentlyAddedProductsData();
    super.onInit();
  }
}
