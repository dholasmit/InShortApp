import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:inshorts_newj/custem_class/constant/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContentScreen extends StatefulWidget {
  const NewsContentScreen({Key? key}) : super(key: key);

  @override
  State<NewsContentScreen> createState() => _NewsContentScreenState();
}

class _NewsContentScreenState extends State<NewsContentScreen> {
  @override
  List<String> images = [
    AppImages.images1,
    AppImages.images2,
    AppImages.isTockPhoto,
    AppImages.poemsBackGroundImage,
    AppImages.renaud,
  ];
  final CarouselController controller = CarouselController();
  List<String> img = [
    AppImages.images1,
    AppImages.images2,
    AppImages.isTockPhoto,
    AppImages.poemsBackGroundImage,
    AppImages.renaud,
  ];
  int current = 0;

  Future<void> share() async {
    await FlutterShare.share(
      title: 'In-ShortApp',
      linkUrl: 'app link attached',
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  print("Data Share");
                  share();
                },
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: false,
                  height: 300.0,
                  viewportFraction: 1,
                  initialPage: img.length,
                  onPageChanged: (i, k) {
                    setState(() {
                      current = i;
                    });
                  }),
              items: img.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                          width: double.infinity,
                          color: Colors.transparent,
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          )
                          // Image.network(
                          //   item,
                          //   fit: BoxFit.cover,
                          // ),
                          ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                var url = "https://www.google.com/";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw "Failed to open LinkedIn";
                }
              },
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Best News In Would",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Ratan Naval Tata (born 28 December 1937) is an Indian businessman and former chairman of Tata Sons. He was also the chairman of the Tata Group from 1990 to 2012, serving also as interim chairman from October 2016 through February 2017. He continues to head its charitable trusts.[2][3] In 2008, he received the Padma Vibhushan, the second highest civilian honour in India, after receiving the Padma Bhushan, the third highest civilian honour in 2000.[4]He is the son of Naval Tata, who was adopted by Ratanji Tata, son of Jamsetji Tata, the founder of the Tata Group. He graduated from the Cornell University College of Architecture with a bachelor's degree in architecture.[5] He joined Tata in 1961, where he worked on the shop floor of Tata Steel. He later succeeded J. R. D. Tata's as chairman of Tata Sons upon the latter's retirement in 1991. Under his tenure the Tata Group acquired Tetley, Jaguar Land Rover, and Corus, in an attempt to turn Tata from a largely India-centric group into a global business. Tata is also one of the largest philanthropists in the world, having donated around 60–65% of his income to charity.",
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     mainAxisAlignment:
            //         MainAxisAlignment.spaceBetween,
            //     children: [
            //       IconButton(
            //         onPressed: () {},
            //         icon: const Icon(
            //           Icons.bookmark_border,
            //           color: Colors.black,
            //         ),
            //       ),
            //       IconButton(
            //         onPressed: () {},
            //         icon: const Icon(
            //           Icons.share,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
