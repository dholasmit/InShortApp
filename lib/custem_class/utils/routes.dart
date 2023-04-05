import 'package:get/get.dart';

import '../../ui/news_screen/view/news_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: NewsScreen.routeName, page: () => const NewsScreen()),
];
