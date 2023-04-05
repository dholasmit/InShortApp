import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inshorts_newj/custem_class/constant/app_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Poems2Screen extends StatefulWidget {
  const Poems2Screen({Key? key}) : super(key: key);

  @override
  State<Poems2Screen> createState() => _Poems2ScreenState();
}

class _Poems2ScreenState extends State<Poems2Screen> {
  List<String> poems2 = [
    "Google was officially launched in 1998 by Larry Page and Sergey Brin to market Google Search, which has become the most used web-based search engine. Larry Page and Sergey Brin, students at Stanford University in California, developed a search algorithm at first known as  in 1996, with the help of Scott Hassan and Alan Steremberg. The search engine soon proved successful and the expanding company moved several times, finally settling at Mountain View in 2003",
    "The company launched Google News in 2002, Gmail in 2004, Google Maps in 2005, Google Chrome in 2008, and the social network known as Google+ in 2011 (which was shut down in April 2019),",
    "Apple became the first publicly traded U.S. company to be valued at over 1 trillion in August 2018, then 2 trillion in August 2020, and 3 trillion in January 2022. As of January 2023, it was valued at around 2.2 trillion. ",
    "The Lisa division would be plagued by infighting, and in 1982 Jobs was pushed off the project.",
    "5",
  ];
  final CarouselController controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.poemsBackGroundImage), fit: BoxFit.fill
                // NetworkImage(
                //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3Gg_QYj5RAGQ8M0e3JDMOM1RkgW7077TrT-KeYx0Qms5d0j-osyzAaTetbGgc6Yq0YjM&usqp=CAU",
                // ),
                // fit: BoxFit.fill,
                )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    autoPlay: false,
                    height: 250.0,
                    viewportFraction: 1,
                    initialPage: poems2.length,
                    onPageChanged: (i, k) {
                      setState(() {
                        _current = i;
                      });
                    }),
                items: poems2.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Text(
                        item.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              AnimatedSmoothIndicator(
                activeIndex: _current,
                count: poems2.length,
                effect: const JumpingDotEffect(
                  //radius: 50,
                  dotWidth: 10,
                  dotHeight: 10,
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey,
                  //paintStyle:  PaintingStyle.fill,
                ), // your preferred effect
                onDotClicked: (index) {
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
