import 'package:get/get.dart';

import '../../../models/explore/explore_list_model.dart';
import '../../../models/explore/explore_topic_model.dart';
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
  HomePageProductsModel? _homePageProductsModel;

  HomePageProductsModel? get getHomePageProductsModel => _homePageProductsModel;

  set setHomePageProductsModel(HomePageProductsModel? value) {
    _homePageProductsModel = value;
    update();
  }

  Future<void> exploreListData() async {
    exploreLoader = true;
    setHomePageProductsModel = await ExploreApi.getExploreList();
    exploreLoader = false;
    update(["exploreListData"]);
  }

  ///
  /// category
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
    exploreListData();
    exploreTopicListData();

    /// recentlyAddedProductsData();
    super.onInit();
  }
}
