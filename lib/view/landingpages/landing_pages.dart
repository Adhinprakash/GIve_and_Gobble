import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/landingpages/widgets/login_showdialoag.dart';
import 'package:give_gobble/view/landingpages/widgets/signup_showdialog.dart';
import 'package:sizer/sizer.dart';

class LandingPages extends StatelessWidget {
  const LandingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 10.sp, top: 20),
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
                    LoginShowdialoag(
                      color: kpink,
                      text: "Login",
                    ),
                    kHeightFive,
                    SignupDialogwidger(
                      color: kpink,
                      text: "Signup",
                    )
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
