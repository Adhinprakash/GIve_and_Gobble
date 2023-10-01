import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/news_request/news_request.dart';
import 'package:give_gobble/controller/provider/restarant_signup.dart';
import 'package:give_gobble/controller/provider/restaurant_login.dart';
import 'package:give_gobble/view/Restaurant/restaurant_mainpage/widget/res_newslist_widget.dart';
import 'package:give_gobble/view/Restaurant/widgets/restaurant_cardwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../landingpages/landing_pages.dart';

class ScreenHomeRestaurant extends StatelessWidget {
  const ScreenHomeRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<RestaurantProvider>(context, listen: false)
        .getRestaurantDetailsFromSharedPreferences();
    Provider.of<NewsApi>(context, listen: false).getnews();
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Give&Gobble",
                      style: GoogleFonts.reenieBeanie(color: kpink, fontSize: 45),
                    ),
                       IconButton(
                        color: kpurple,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Logout Confirmation'),
                              content: const Text(
                                  'Are you sure you want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    // Access the UserLogin class using Provider and call the logout method.

                                    bool logout = await Provider.of<ResLogin>(
                                            context,
                                            listen: false)
                                        .restaurantlogout(context);
                                    if (logout) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LandingPages(),
                                        ),
                                        (route) => false,
                                      );
                                      // ignore: use_build_context_synchronously
                                      Provider.of<ResLogin>(context,
                                              listen: false)
                                          .emailOResnamecontroller
                                          .clear();
                                    }
                                  },
                                  child: const Text('Logout'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.logout,
                        ),
                        iconSize: 25,
                      )
                  ],
                ),
                kheight30,
                Center(
                  child: Container(
                      width: 380,
                      height: 200,
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
                              width: 150,
                              height: 160,
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
                      child: RestuarantCardWidget(
                        text: "Food",
                        image: "assets/food-removebg-preview.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        String url = 'https://give.do/';
                        await launchUrl(Uri.parse(url));
                      },
                      child: RestuarantCardWidget(
                        text: "Education",
                        image: "assets/Graduation_hat-removebg-preview.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        String url = 'https://www.waterforpeople.org/india/';
                        await launchUrl(Uri.parse(url));
                      },
                      child: RestuarantCardWidget(
                        text: "Water",
                        image: "assets/waterbottle-removebg-preview (1).png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        String url = 'https://sadsindia.org/';
                        await launchUrl(Uri.parse(url));
                      },
                      child: RestuarantCardWidget(
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
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return ResnewslistWidget(
                              title: article[index].title,
                              image: article[index].urlToImage,
                              desc: article[index].description,
                            );
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
