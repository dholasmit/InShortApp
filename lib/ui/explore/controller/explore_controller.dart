import 'package:get/get.dart';

class ExploreController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    update();
  }

  List<String> newsName = [
    "All",
    "Sports",
    "Politics",
    "Business",
    "Fashion",
    "All",
    "Sports",
    "Politics",
    "Business",
    "Fashion",
  ];
}
