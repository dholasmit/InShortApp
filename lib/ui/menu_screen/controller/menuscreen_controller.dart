import 'package:get/get.dart';

import '../../../models/menu_screen_model/proudctcategories_model.dart';
import '../../../services/menu_screen_repo/product_categories_repo.dart';

class MenuScreenController extends GetxController {
  /// comment for my side
  // List<Product> _productData = [];
  //
  // List<Product> get productData => _productData;
  //
  // set productData(List<Product> value) {
  //   _productData = value;
  //   update();
  // }
  List<Product> _product = [];

  List<Product> get product => _product;

  set product(List<Product> value) {
    _product = value;
    update();
  }

  Future<void> categories() async {
    ProductCategoriesModel? productCategoriesModel =
        await ProductCategoriesRepo.productCategoriesScreen();

    if (productCategoriesModel != null) {
      product = productCategoriesModel.products;
    }
  }
}
