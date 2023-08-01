import 'package:get/get.dart';

import '../../../models/explore/all_categories_model.dart';
import '../../../services/Explore_screen_repo/popular_topic_repo.dart';

class PopularTopicController extends GetxController {
  bool popularLoader = false;
  List<AllCategoriesModel>? _allCategoriesModel;

  List<AllCategoriesModel>? get getAllCategoriesModel => _allCategoriesModel;

  set setAllCategoriesModel(List<AllCategoriesModel>? value) {
    _allCategoriesModel = value;
    update();
  }

  Future<void> popularData() async {
    popularLoader = true;
    setAllCategoriesModel = await PopularTopicApi.getPopularTopic();
    popularLoader = false;
    update(["popularData"]);
  }

  @override
  void onInit() {
    popularData();
    super.onInit();
  }
}
