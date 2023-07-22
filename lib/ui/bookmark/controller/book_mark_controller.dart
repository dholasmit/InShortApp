import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/bookmark/bookmark_model.dart';
import '../../../services/bookmark/bookmark_repo.dart';

class BookMarkController extends GetxController {
  TextEditingController searchController = TextEditingController();

  //
  // BookMarkData? _bookMarkData;
  //
  // BookMarkData? get getBookMarkData => _bookMarkData;
  //
  // set setBookMarkData(BookMarkData? value) {
  //   _bookMarkData = value;
  //   update();
  // }
  // BookMarkModel? _bookMarkModel;
  //
  // BookMarkModel? get getBookMarkModel => _bookMarkModel;
  //
  // set setBookMarkModel(BookMarkModel? value) {
  //   _bookMarkModel = value;
  //   update();
  // }
  // List<Item> itemData = [];
  BookMarkModel? bookmarkData;
  Future<void> bookMarkListData() async {
    // itemData = await BookmarkApi.bookmarkList();
    bookmarkData = await BookmarkApi.bookmarkList();
    print("BookMarkData:- ${bookmarkData?.message}");
    update(["bookMark"]);
  }

  @override
  void onInit() {
    bookMarkListData();
    super.onInit();
  }
}
