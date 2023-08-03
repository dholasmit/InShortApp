import 'package:get/get.dart';

import '../../../custem_class/utils/globle.dart';
import '../../../models/bookmark/addbookmark_model.dart';
import '../../../models/home/recently_added_products_model.dart';
import '../../../services/bookmark/bookmark_repo.dart';
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

  /// Add BookMark
  Future<void> addBookMark({
    required int ProductId,
  }) async {
    AddBookMarkModel? addBookMarkModel = await BookmarkApi.addBookmarkRepo(
      CustomerGUID: userController.userModel!.customerGuid.toString(),
      ProductId: ProductId,
    );

    if (addBookMarkModel != null) {
      return;
    }
  }

  @override
  void onInit() {
    homeRecentlyAddedProductsData();
    super.onInit();
  }
}
