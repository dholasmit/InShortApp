import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_newj/custem_class/constant/app_images.dart';

import '../../setting_screen/view/setting_Screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              Get.to(const SettingScreen());
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(60),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 10),
        //     child: Column(
        //       children: [
        //         TextFormField(
        //           decoration: InputDecoration(
        //             fillColor: Colors.black12,
        //             filled: true,
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(10),
        //               borderSide: const BorderSide(color: Colors.black12),
        //             ),
        //             focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(10),
        //               borderSide: const BorderSide(color: Colors.black12),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(height: 10),
        //       ],
        //     ),
        //   ),
        // ),
      ),
      body: ListView(
        //   crossAxisAlignment: CrossAxisAlignment.start,
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
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 100,
                      ),
                      Text(
                        "Star",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
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
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
      ),
    );
  }
}
