// import 'dart:convert';
//
// import '../../custem_class/utils/globle.dart';
// import '../../models/menu_screen_model/proudctcategories_model.dart';
// import '../api_handler.dart';
// import '../api_routes.dart';
//
// class ProductCategoriesRepo {
//   static Future<ProductCategoriesModel?> productCategoriesScreen() async {
//     var responseBody = await API.apiHandler(
//       url: APIRoutes.productCategories,
//       header: {
//         'Content-Type': 'application/json',
//         'Authorization': "Bearer ${userController.userModel!.token}",
//       },
//       body: jsonEncode({}),
//     );
//     if (responseBody != null) {
//       return ProductCategoriesModel.fromJson(responseBody);
//     } else {
//       return null;
//     }
//   }
// }
