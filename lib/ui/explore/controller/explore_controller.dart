import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/ui/explore/controller/popular_topic_controller.dart';

import '../../../models/explore/all_categories_model.dart';
import '../../../models/explore/explore_topic_model.dart';
import '../../../models/explore/getprodectbycategory_model.dart';
import '../../../services/Explore_screen_repo/explore_list_repo.dart';

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
    print("Index==> $selectedIndex1");
    update(["flot", "product"]);
  }

  Future<void> homeRecentlyAddedProductsData({int? pageIndex}) async {
    loader = true;
    update(["flot", "product"]);
    if (pageIndex == null) {
      setExploreTopicListModel = await ExploreApi.getProductsByCategoryData(
          id: getAllCategoriesModel![selectedIndex].id!, page: page);
    } else {
      ExploreTopicListModel data = await ExploreApi.getProductsByCategoryData(
          id: getAllCategoriesModel![selectedIndex].id!, page: pageIndex);
      _exploreTopicListModel!.data!.addAll(data.data!);
    }
    loader = false;
    update(["flot", "product"]);
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
