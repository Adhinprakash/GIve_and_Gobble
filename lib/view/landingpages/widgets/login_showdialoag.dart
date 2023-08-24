import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/login/screen_login.dart';
import 'package:give_gobble/view/login/screen_ngo_login.dart';
import 'package:sizer/sizer.dart';

import '../../login/screen_res_login.dart';

class LoginShowdialoag extends StatelessWidget {
  const LoginShowdialoag({super.key, required this.color, required this.text});
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 60.w,
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
                    height: 50.h,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ScreenRestaurantLogin()),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreenNgoLogin()),
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
                                          weight: FontWeight.w500,
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
                                                  ScreenLogin()),
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
                                          weight: FontWeight.w500,
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
            style: ElevatedButton.styleFrom(foregroundColor: color),
            child: Text(
              text,
            )));
  }
}
