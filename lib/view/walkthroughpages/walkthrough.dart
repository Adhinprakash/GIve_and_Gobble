import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/landingpages/landing_pages.dart';
import 'package:give_gobble/view/walkthroughpages/page_one.dart';
import 'package:give_gobble/view/walkthroughpages/page_three.dart';
import 'package:give_gobble/view/walkthroughpages/page_two.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkThroughPages extends StatefulWidget {
  const WalkThroughPages({super.key});

  @override
  State<WalkThroughPages> createState() => _WalkThroughPagesState();
}

class _WalkThroughPagesState extends State<WalkThroughPages> {
  Image? image1;
  Image? image2;
  Image? image3;

  @override
  void initState() {
    
    super.initState();
    image1 =
        Image.asset("assets/We can be  the generation  that ends hunger.jpg");
    image2 = Image.asset("assets/pexels-ifenacho-solomon-13162766.jpg");
    image3 = Image.asset("assets/pexels-riya-kumari-10023685.jpg");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image1!.image, context);
    precacheImage(image2!.image, context);
    precacheImage(image3!.image, context);
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  final controller = PageController();
  bool onlastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onlastpage = (index == 2);
              });
            },
            controller: controller,
            children: const [PageOne(), PageTwo(), PageThree()],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.jumpToPage(2);
                    },
                    child: Text(
                      "Skip",
                      style: textStyleFuc(
                          weight: FontWeight.w500,
                          color: Colors.white,
                          size: 17),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const SlideEffect(
                        activeDotColor: Colors.white,
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        dotWidth: 10),
                  ),
                  onlastpage
                      ? GestureDetector(
                          onTap: () async{
                             SharedPreferences iswalkthroughpages=await SharedPreferences.getInstance();
                             iswalkthroughpages.setBool('iswalkthroughpages', true);
                            // ignore: use_build_context_synchronously
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const LandingPages();
                              },
                            ));
                          },
                          child: Text("Done",
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: Colors.white,
                                  size: 17)),
                        )
                      : GestureDetector(
                          onTap: () {
                            controller.nextPage(
                                duration: const Duration(microseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text("Next",
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: Colors.white,
                                  size: 17)),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
