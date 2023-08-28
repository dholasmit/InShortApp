import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

import '../../menu_screen/view/menu_screen.dart';
import 'news_types/gif_screen.dart';
import 'news_types/news_content_screen.dart';
import 'news_types/poems_screen.dart';
import 'news_types/video_screen.dart';

// import 'package:inshorts_newj/ui/news_screen/news_types/news_content_screen.dart';
// import '../news_types/gif_screen.dart';
// import '../news_types/poems_screen.dart';
// import '../news_types/video_screen.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = "/NewsScreen";

  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<String> images = [
    "https://thumbs.dreamstime.com/b/silhouette-bridge-crab-plover-birds-image-taken-surat-city-golden-hour-photographers-stunning-170042876.jpg",
    "https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://imgd.aeplcdn.com/1056x594/n/cw/ec/102709/ntorq-125-right-front-three-quarter.jpeg?isig=0&q=75",
    "https://pixlr.com/images/index/remove-bg.webp",
    "https://images.unsplash.com/photo-1581456495146-65a71b2c8e52?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fHBlcnNvbnxlbnwwfHwwfHw%3D&w=1000&q=80",
  ];
  final CarouselController controller = CarouselController();
  List<String> img = [
    "https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80",
    "https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReFjO6rbNAKcZtfgpqkhnqWGPwcH5hAArN1A&usqp=CAU",
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20),
      //   child: Container(
      //     color: Colors.grey,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         IconButton(
      //           onPressed: () {
      //
      //           },
      //           icon: const Icon(
      //             Icons.bookmark_border,
      //             color: Colors.white,
      //           ),
      //         ),
      //         IconButton(
      //           onPressed: () {},
      //           icon: const Icon(
      //             Icons.share,
      //             color: Colors.white,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "E-News",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.toNamed(MenuScreen.routeName);
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),

        // actions: [
        //   IconButton(
        //       icon: const Icon(
        //         Icons.lightbulb,
        //         color: Colors.black,
        //       ),
        //       onPressed: () {
        //         Get.isDarkMode
        //             ? Get.changeTheme(ThemeData.light())
        //             : Get.changeTheme(ThemeData.dark());
        //       })
        // ],
        ///
        // actions: [
        //   // IconButton(
        //   //     onPressed: () {
        //   //       Get.to(const GifScreen());
        //   //     },
        //   //     icon: const Icon(
        //   //       Icons.gif,
        //   //       color: Colors.black,
        //   //       size: 25,
        //   //     ))
        // ],
      ),
      body: Swiper(
        itemCount: images.length,
        autoplay: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return index == 1
              ? const Poems2Screen()
              : index == 2
                  ? const GifScreen()
                  : index == 3
                      ? const VideoScreen()
                      : const NewsContentScreen();
        },
      ),
    );
  }
}
