import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/bookmark/bookmark_model.dart';
import '../../../models/bookmark/remove_bookmark_model.dart';
import '../../../services/bookmark/bookmark_repo.dart';

class BookMarkController extends GetxController {
  TextEditingController searchController = TextEditingController();

  /// BookMark Data show List
  BookMarkModel? bookMarkModel;

  Future<void> bookMarkListData() async {
    bookMarkModel = await BookmarkApi.bookmarkList();
    update(["bookMark"]);
  }

  /// Remove BookMark Model
  ///
  bool bookMarkBool = false;

  RemoveBookmarkModel? _removeBookmarkModel;

  RemoveBookmarkModel? get removeBookmarkModel => _removeBookmarkModel;

  set removeBookmarkModel(RemoveBookmarkModel? value) {
    _removeBookmarkModel = value;
    update();
  }

  Future<void> removeBookMark({
    required String CustomerGUID,
    required int ItemIds,
  }) async {
    RemoveBookmarkModel? removeBookmarkModel =
        await BookmarkApi.removeBookmarkRepo(
      CustomerGUID: CustomerGUID,
      ItemIds: ItemIds,
    );

    if (removeBookmarkModel != null) {
      return;
    }
  }

  @override
  void onInit() {
    bookMarkListData();
    super.onInit();
  }
}
