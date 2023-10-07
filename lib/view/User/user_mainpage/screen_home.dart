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

import '../../../controller/provider/user_login.dart';
import '../../landingpages/landing_pages.dart';

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
            padding:  EdgeInsets.all(8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<UserLogin>(
                  builder:(context, value, child) {
                    return Row(
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
                                        bool logoutsuccesss =
                                            await Provider.of<UserLogin>(context,
                                                    listen: false)
                                                .logout(context);

                                        if (logoutsuccesss) {
                                          // ignore: use_build_context_synchronously
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LandingPages(),
                                            ),
                                            (route) => false,
                                          );
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
                          ),
                      ],
                    );
                  }, 
                ),
                kheight30,
                Center(
                  child: Container(
                      width: 86.w,
                      height: 25.h,
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
                        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
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
                                        child: const Text("Donation"),
                                        style:ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18.sp,
                                               vertical: 11.sp
                                          )
                                        ) ,
                                        )
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
                Container(
                  width: 100.w,
                  child: Row(
                    
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
