import 'package:get/get.dart';

import '../../../models/explore/all_categories_model.dart';
import '../../../services/Explore_screen_repo/popular_topic_repo.dart';

class PopularTopicController extends GetxController {
  // AllCategoriesModel? _allCategoriesModel;
  //
  // AllCategoriesModel? get allCategoriesModel => _allCategoriesModel;
  //
  // set allCategoriesModel(AllCategoriesModel? value) {
  //   _allCategoriesModel = value;
  //   update();
  // }
  List<AllCategoriesModel>? _allCategoriesModel;

  List<AllCategoriesModel>? get getAllCategoriesModel => _allCategoriesModel;

  set setAllCategoriesModel(List<AllCategoriesModel>? value) {
    _allCategoriesModel = value;
    update();
  }

  Future<void> popularData() async {
    setAllCategoriesModel = await PopularTopicApi.getPopularTopic();
    update(["bg"]);
  }

  @override
  void onInit() {
    popularData();
    super.onInit();
  }
}
