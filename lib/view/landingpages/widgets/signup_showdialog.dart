import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/NGO/ngoregistration/screen_ngo_registration.dart';
import 'package:give_gobble/view/User/userRegistation/first_page.dart';
import 'package:sizer/sizer.dart';

import '../../Restaurant/restaurant_registration/screen_res_registration.dart';

class SignupDialogwidger extends StatelessWidget {
  const SignupDialogwidger(
      {super.key, required this.text, required this.color});
  final String text;
  final Color color;

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
                                                const ScreenResRegistration()),
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
                                                  const ScreenNgoRegistration()),
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
                                                  const ScreenRegistration()),
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
