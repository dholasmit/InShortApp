import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/menu_screen_model/categories_model.dart';
import '../../../services/api_routes.dart';

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
  // List<Product> _product = [];
  //
  // List<Product> get product => _product;
  //
  // set product(List<Product> value) {
  //   _product = value;
  //   update();
  // }
  //
  // Future<void> categories() async {
  //   ProductCategoriesModel? productCategoriesModel =
  //       await ProductCategoriesRepo.productCategoriesScreen();
  //
  //   if (productCategoriesModel != null) {
  //     product = productCategoriesModel.products;
  //   }
  // }

  CategoriesModel? categoriesModel;

  @override
  void onInit() {
    categoriesData();
    super.onInit();
  }

  Future<void> categoriesData() async {
    String url = APIRoutes.categories;
    final response = await http.get(Uri.parse(url));
    debugPrint("url=========>$url");

    if (response.statusCode == 200) {
      categoriesModel = CategoriesModel.fromJson(jsonDecode(response.body));
      update();
      print("RESPONSE ==========>  ${response.body}");
    } else {
      throw Exception('Failed to load album');
    }
  }
}
