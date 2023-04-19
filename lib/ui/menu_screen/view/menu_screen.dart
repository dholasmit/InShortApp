import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inshorts_newj/custem_class/constant/app_images.dart';
import 'package:inshorts_newj/services/api_routes.dart';

import '../../../models/menu_screen_model/categories_model.dart';
import '../../../models/menu_screen_model/proudctcategories_model.dart';
import '../../setting_screen/view/setting_Screen.dart';
import '../controller/menuscreen_controller.dart';

class MenuScreen extends StatefulWidget {
  static const String routeName = "/MenuScreen";

  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  MenuScreenController menuScreenController = Get.find<MenuScreenController>();

  /// ProductCategories API
  ProductCategoriesModel? productCategoriesModel;

  Future<void> productCategoriesData() async {
    String url = APIRoutes.productCategories;
    final response = await http.get(Uri.parse(url));
    debugPrint("url=========>$url");

    if (response.statusCode == 200) {
      productCategoriesModel =
          ProductCategoriesModel.fromJson(jsonDecode(response.body));

      setState(() {});
      print("RESPONSE ==========>  ${response.body}");
    } else {
      throw Exception('Failed to load album');
    }
  }

  ///  ctCategories API
  CategoriesModel? categoriesModel;

  Future<void> categoriesData() async {
    String url = APIRoutes.categories;
    final response = await http.get(Uri.parse(url));
    debugPrint("url=========>$url");

    if (response.statusCode == 200) {
      categoriesModel = CategoriesModel.fromJson(jsonDecode(response.body));

      setState(() {});
      print("RESPONSE ==========>  ${response.body}");
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    /// productCategoriesData();
    categoriesData();

    /// menuScreenController.categories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Menu",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(SettingScreen.routeName);
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: GetBuilder(
        builder: (MenuScreenController menuScreenController) {
          return ListView(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage(AppImages.images2),
                                // NetworkImage(
                                //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtfiAaZbqD-lDtiPBF2ca9aUL8on_V1dU8eh6bSdcF&s",
                                // ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "CATEGORIES",
                  style: TextStyle(
                    ///  color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 130,
                color: Colors.transparent,
                child: ListView.builder(

                    ///itemCount: menuScreenController.product.length,

                    itemCount: categoriesModel?.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      print(
                          "DATA LENGTH ======> ${categoriesModel?.categories.length}");

                      return Column(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "${categoriesModel?.categories[index].name}",

                              /// menuScreenController.product[index].name,
                            ),
                          )
                        ],
                      );
                    }),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "SUGGESTED TOPICS",
                  style: TextStyle(
                    /// color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150,
                        childAspectRatio: 8 / 8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("Demo");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage(AppImages.images1),
                                // NetworkImage(
                                //   "https://media.istockphoto.com/id/1312835994/photo/cricket-bat-and-ball-on-cricket-pitch.jpg?b=1&s=170667a&w=0&k=20&c=dJW5g6h-hhvrsUUf3Ozsq4i2wkG9tatk_3lzCFVqH9g=",
                                //   // "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80",
                                // ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
