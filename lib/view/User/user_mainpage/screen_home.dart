import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/news_request/news_request.dart';
import 'package:give_gobble/controller/provider/user_signup.dart';
import 'package:give_gobble/view/User/user_mainpage/widgets/newslist_widget.dart';
import 'package:give_gobble/view/User/widgets/card_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState
 
  () => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false)
        .getUserDetailsFromSharedPreferences();
    Provider.of<NewsApi>(context, listen: false).getnews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Give&Gobble",
                  style: GoogleFonts.reenieBeanie(color: kpink, fontSize: 45),
                ),
                kheight30,
                Center(
                  child: Container(
                      width: 86.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(255, 122, 93, 170),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: const Offset(0, 4))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Share Your Love \n with donation ",
                                  style: textStyleFuc(
                                      weight: FontWeight.w500,
                                      color: kwhite,
                                      size: 21),
                                ),
                                kHeight15,
                                ElevatedButton(
                                    onPressed: () async {
                                      String url =
                                          'https://www.akshayapatra.org';
                                      await launchUrl(Uri.parse(url));
                                    },
                                    child: const Text("Donation"))
                              ],
                            ),
                            Image.asset(
                              "assets/cardimage-removebg-preview.png",
                              width: 35.w,
                              height: 16.h,
                            )
                          ],
                        ),
                      )),
                ),
                kHeight15,
                Text(
                  "Donate",
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: kBlack, size: 20),
                ),
                kHeightFive,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        String url = 'https://www.feedingindia.org/';
                        await launchUrl(Uri.parse(url));
                      },
                      child: const CardWidget(
                        text: "Food",
                        image: "assets/food-removebg-preview.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        String url = 'https://give.do/';
                        await launchUrl(Uri.parse(url));
                      },
                      child: const CardWidget(
                        text: "Education",
                        image: "assets/Graduation_hat-removebg-preview.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        String url = 'https://www.waterforpeople.org/india/';
                        await launchUrl(Uri.parse(url));
                      },
                      child: const CardWidget(
                        text: "Water",
                        image: "assets/waterbottle-removebg-preview (1).png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        String url = 'https://sadsindia.org/';
                        await launchUrl(Uri.parse(url));
                      },
                      child: const CardWidget(
                        text: "Clothes",
                        image: "assets/clothes-removebg-preview.png",
                      ),
                    ),
                  ],
                ),
                kheight30,
                Text(
                  "Latest Updates ",
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: kBlack, size: 20),
                ),
                kheight30,
                Consumer<NewsApi>(
                  builder: (context, newapinotifier, child) {
                    final article = newapinotifier.articles;
                    if (newapinotifier.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        height: 50.h,
                        width: 100.w,
                        child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return NewslistWidget(
                              title: article[index].title,
                              image: article[index].urlToImage,
                              desc: article[index].description,
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                kHeight15
              ],
            ),
          )
        ],
      )),
    );
  }
}
