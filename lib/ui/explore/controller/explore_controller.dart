import 'package:get/get.dart';

import '../../../models/explore/explore_list_model.dart';
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
  List<ExploreListApiModel>? _exploreListApiModel;

  List<ExploreListApiModel>? get exploreListApiModel => _exploreListApiModel;

  set exploreListApiModel(List<ExploreListApiModel>? value) {
    _exploreListApiModel = value;
    update();
  }

  Future<void> exploreListData() async {
    exploreListApiModel = await ExploreListApi.getExploreList();
    update(["bg"]);
  }
}
