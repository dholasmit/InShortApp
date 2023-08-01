import 'package:get/get.dart';

import '../../../models/home/recently_added_products_model.dart';
import '../../../services/home/home_screen_repo.dart';

class HomeScreenController extends GetxController {
  HomeRecentlyAddedProductsModel? _homeRecentlyAddedProductsModel;

  HomeRecentlyAddedProductsModel? get getHomeRecentlyAddedProductsModel =>
      _homeRecentlyAddedProductsModel;

  set setHomeRecentlyAddedProductsModel(HomeRecentlyAddedProductsModel? value) {
    _homeRecentlyAddedProductsModel = value;
    update();
  }

  bool loader = false;

  Future<void> homeRecentlyAddedProductsData() async {
    loader = true;
    setHomeRecentlyAddedProductsModel =
        await HomeScreenApi.homeRecentlyAddedProducts();
    loader = false;
    update(["homeData"]);
  }

  @override
  void onInit() {
    homeRecentlyAddedProductsData();
    super.onInit();
  }
}
