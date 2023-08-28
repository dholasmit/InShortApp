import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/bookmark/bookmark_model.dart';
import '../../../models/bookmark/remove_bookmark_model.dart';
import '../../../services/bookmark/bookmark_repo.dart';

class BookMarkController extends GetxController {
  TextEditingController searchController = TextEditingController();
  bool bookmarkLoader = false;

  /// BookMark Data show List
  BookMarkModel? bookMarkModel;

  Future<void> bookMarkListData() async {
    bookmarkLoader = true;
    bookMarkModel = await BookmarkApi.bookmarkList();
    bookmarkLoader = false;
    update(["bookMark"]);
  }

  /// Remove BookMark Model
  ///

  RemoveBookmarkModel? _removeBookmarkModel;

  RemoveBookmarkModel? get removeBookmarkModel => _removeBookmarkModel;

  set removeBookmarkModel(RemoveBookmarkModel? value) {
    _removeBookmarkModel = value;
    update();
  }

  ///

  /// removeBookMark
  Future<void> removeBookMark({
    required String customerGUID,
    required int itemIds,
  }) async {
    RemoveBookmarkModel? removeBookmarkModel =
        await BookmarkApi.removeBookmarkRepo(
      customerGUID: customerGUID,
      itemIds: itemIds,
    );

    if (removeBookmarkModel != null) {
      return;
    }
  }

  /// addBookMark
  // Future<void> addBookMark({
  //   required String CustomerGUID,
  //   required int ProductId,
  // }) async {
  //   AddBookMarkModel? addBookMarkModel = await BookmarkApi.addBookmarkRepo(
  //     CustomerGUID: CustomerGUID,
  //     ProductId: ProductId,
  //   );
  //
  //   if (addBookMarkModel != null) {
  //     return;
  //   }
  // }

  @override
  void onInit() {
    bookMarkListData();
    super.onInit();
  }
}
