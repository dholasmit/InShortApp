import 'package:get/get.dart';

import '../../../models/explore/explore_list_model.dart';
import '../../../models/explore/explore_topic_model.dart';
import '../../../services/Explore_screen_repo/explore_list_repo.dart';

class ExploreController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    update();
  }

  List<String> newsName = [
    "All",
    "Sports",
    "Politics",
    "Business",
    "Fashion",
    "All",
    "Sports",
    "Politics",
    "Business",
    "Fashion",
  ];

  HomePageProductsModel? _homePageProductsModel;

  HomePageProductsModel? get getHomePageProductsModel => _homePageProductsModel;

  set setHomePageProductsModel(HomePageProductsModel? value) {
    _homePageProductsModel = value;
    update();
  }

  Future<void> exploreListData() async {
    setHomePageProductsModel = await ExploreApi.getExploreList();
    update(["bg"]);
  }

  ExploreTopicListModel? _exploreTopicListModel;

  ExploreTopicListModel? get getExploreTopicListModel => _exploreTopicListModel;

  set setExploreTopicListModel(ExploreTopicListModel? value) {
    _exploreTopicListModel = value;
    update();
  }

  Future<void> exploreTopicListData() async {
    setExploreTopicListModel = await ExploreApi.getExploreTopic();
    update(["bg"]);
  }

  @override
  void onInit() {
    exploreListData();
    exploreTopicListData();
    super.onInit();
  }
}
