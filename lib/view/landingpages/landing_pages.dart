import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/NGO/NgoRegistration/screen_ngo_registration.dart';
import 'package:give_gobble/view/Restaurant/restaurant_registration/screen_res_registration.dart';
import 'package:give_gobble/view/User/userRegistation/first_page.dart';
import 'package:give_gobble/view/login/screen_login.dart';
import 'package:sizer/sizer.dart';

class LandingPages extends StatelessWidget {
  const LandingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.only(left: 10.sp, top: 20),
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: textStyleFuc(
                          weight: FontWeight.w600, color: kBlack, size: 36),
                    ),
                    Text(
                      "Start your helping journey",
                      style: textStyleFuc(
                          weight: FontWeight.w400, color: kBlack, size: 23),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/tiny-people-standing-near-box-donation-food-delivery-volunteers-giving-healthy-grocery-goods-charity-flat-vector-illustration-social-support-humanitarian-help-community-sharin.png",
                  width: 80.w,
                  height: 35.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 60.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ScreenLogin()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kpink, foregroundColor: kwhite),
                          child: const Text("Login"),
                        )),
                    kHeightFive,
                    SizedBox(
                        width:60.w,
                        child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: kwhite,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height:50.h,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:  const EdgeInsets.only(
                                                  left: 40),
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ScreenResRegistration()),
                                                      );
                                                    },
                                                    child: SizedBox(
                                                      width: 20.w,
                                                      height: 20.h,
                                                      child: Image.asset(
                                                          "assets/reastaurant final.png"),
                                                    ),
                                                  ),
                                                  Text(
                                                    "RESTAURANT",
                                                    style: textStyleFuc(
                                                        weight: FontWeight.w500,
                                                        color: kBlack,
                                                        size: 17),
                                                  )
                                                ],
                                              ),
                                            ),
                                            
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ScreenNgoRegistration()),
                                                        );
                                                      },
                                                      child: SizedBox(
                                                        width: 20.w,
                                                        height: 20.h,
                                                        // child: Image.asset(""),
                                                        child: Image.asset(
                                                            "assets/NGO-removebg-preview (1).png"),
                                                      ),
                                                    ),
                                                    Text(
                                                      "NGO",
                                                      style: textStyleFuc(
                                                          weight:
                                                              FontWeight.w500,
                                                          color: kBlack,
                                                          size: 17),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                ScreenRegistration()),
                                                        );
                                                      },
                                                      child: SizedBox(
                                                        width: 20.w,
                                                        height: 20.h,
                                                        child: Image.asset(
                                                            "assets/valunteer-removebg-preview (1).png"),
                                                      ),
                                                    ),
                                                    Text(
                                                      "USER",
                                                      style: textStyleFuc(
                                                          weight:
                                                              FontWeight.w500,
                                                          color: kBlack,
                                                          size: 17),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Sign up",
                            ),
                            style: ElevatedButton.styleFrom(
                                foregroundColor: kpink)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
