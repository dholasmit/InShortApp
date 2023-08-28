import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/ui/explore/controller/popular_topic_controller.dart';

import '../../../custem_class/utils/globle.dart';
import '../../../models/bookmark/addbookmark_model.dart';
import '../../../models/explore/all_categories_model.dart';
import '../../../models/explore/explore_topic_model.dart';
import '../../../models/explore/getprodectbycategory_model.dart';
import '../../../services/Explore_screen_repo/explore_list_repo.dart';
import '../../../services/bookmark/bookmark_repo.dart';
import '../../bookmark/controller/book_mark_controller.dart';

class ExploreController extends GetxController {
  bool exploreLoader = false;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    update();
  }

  ///
  /// category List
  ///
  ///
  ///
  // HomePageProductsModel? _homePageProductsModel;
  //
  // HomePageProductsModel? get getHomePageProductsModel => _homePageProductsModel;
  //
  // set setHomePageProductsModel(HomePageProductsModel? value) {
  //   _homePageProductsModel = value;
  //   update();
  // }
  //
  // Future<void> exploreListData() async {
  //   exploreLoader = true;
  //   setHomePageProductsModel = await ExploreApi.getExploreList();
  //   exploreLoader = false;
  //   update(["exploreListData"]);
  // }

  ///
  /// category
  ///
  int selectedIndex1 = 0;
  int prevIndex = 0;
  int page = 1;
  bool flotClose = false;
  bool loader = false;
  PopularTopicController popularTopicController =
      Get.find<PopularTopicController>();
  SwiperController pageController = SwiperController();
  List<AllCategoriesModel>? _allCategoriesModel;

  List<AllCategoriesModel>? get getAllCategoriesModel => _allCategoriesModel;

  set setAllCategoriesModel(List<AllCategoriesModel>? value) {
    _allCategoriesModel = value;
    update();
  }

  Future<void> onChangeIndex(int index) async {
    if (selectedIndex1 == (page * 10) - 2 && prevIndex < selectedIndex1) {
      page = page + 1;
      await popularTopicController.popularData();
      pageController.move(index, animation: false);
    }
    prevIndex = selectedIndex1;
    selectedIndex1 = index;
    flotClose = false;
    debugPrint("Index==> $selectedIndex1");
    update(["flotPopular", "productPopular"]);
  }

  Future<void> homeRecentlyAddedProductsData({int? pageIndex}) async {
    loader = true;
    update(["flotPopular", "productPopular"]);
    if (pageIndex == null) {
      setExploreTopicListModel = await ExploreApi.getProductsByCategoryData(
          id: getAllCategoriesModel![selectedIndex1].id!, page: page);
    } else {
      ExploreTopicListModel data = await ExploreApi.getProductsByCategoryData(
          id: getAllCategoriesModel![selectedIndex1].id!, page: pageIndex);
      _exploreTopicListModel!.data!.addAll(data.data!);
    }
    loader = false;
    update(["flotPopular", "productPopular"]);
  }

  ///
  ExploreTopicListModel? _exploreTopicListModel;

  ExploreTopicListModel? get getExploreTopicListModel => _exploreTopicListModel;

  set setExploreTopicListModel(ExploreTopicListModel? value) {
    _exploreTopicListModel = value;
    update();
  }

  Future<void> exploreTopicListData() async {
    exploreLoader = true;
    setExploreTopicListModel = await ExploreApi.getExploreTopic();
    exploreLoader = false;
    // update(["exploreData"]);
  }

  /// GetProductsByCategory
  GetProductsByCategoryModel? _getProductsByCategoryModel;

  GetProductsByCategoryModel? get getProductsByCategoryModel =>
      _getProductsByCategoryModel;

  set setProductsByCategoryModel(GetProductsByCategoryModel? value) {
    _getProductsByCategoryModel = value;
    update(["GetProductsByCategory"]);
  }

  Future<void> getProductsByCategoryList({required int id}) async {
    exploreLoader = true;
    setProductsByCategoryModel =
        await ExploreApi.getProductsByCategoryData(id: id, page: page);
    exploreLoader = false;
    update(["GetProductsByCategory"]);
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

  Future<void> onTapBookMark() async {
    bool isBook = getProductsByCategoryModel!.data![selectedIndex1].markAsNew!;
    // getHomeRecentlyAddedProductsModel!.data![selectedIndex].markAsNew!;

    getProductsByCategoryModel!.data![selectedIndex1].markAsNew = !isBook;
    int id = getProductsByCategoryModel!.data![selectedIndex1].id!;
    if (isBook == false) {
      await addBookMark(productId: id);
      update(["flotPopular", "productPopular"]);
    } else {
      removeBookMarkData();
      update(["flotPopular", "productPopular"]);
    }
  }

  /// removeBook Mark API
  BookMarkController bookMarkController = Get.find<BookMarkController>();

  removeBookMarkData() {
    return bookMarkController.removeBookMark(
      customerGUID: bookMarkController.bookMarkModel?.data?.customerGuid ?? "",
      itemIds: getProductsByCategoryModel!.data![selectedIndex1].id!,
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

  ///
  /// RecentlyAddedProducts
  ///
  // RecentlyAddedProductsModel? _recentlyAddedProductsModel;
  //
  // RecentlyAddedProductsModel? get getRecentlyAddedProductsModel =>
  //     _recentlyAddedProductsModel;
  //
  // set getRecentlyAddedProductsModel(RecentlyAddedProductsModel? value) {
  //   _recentlyAddedProductsModel = value;
  //   update();
  // }
  /// this API is not play
  //
  // Future<void> recentlyAddedProductsData() async {
  //   exploreLoader = true;
  //   setHomePageProductsModel = await ExploreApi.recentlyAddedProductsList();
  //   exploreLoader = false;
  //   update();
  // }

  ///

  @override
  void onInit() {
    //  exploreListData();
    ///getProductsByCategoryList();
    exploreTopicListData();
    popularTopicController.popularData();

    /// recentlyAddedProductsData();
    super.onInit();
  }
}
