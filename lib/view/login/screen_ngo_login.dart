
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/ngo_login.dart';
import 'package:give_gobble/view/NGO/screenmain.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../landingpages/landing_pages.dart';
import 'forgotpassword/screen_forgotpassword.dart';

class ScreenNgoLogin extends StatelessWidget {
  const ScreenNgoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Image.asset(
                      "assets/man-donating-food-5237907-4409150.webp"),
                ),
                kheight30,
                Text(
                  "Login to account",
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: kpink, size: 26),
                ),
                kheight30,
                SizedBox(
                  height: 8.h,
                  width: 80.w,
                  child: TextFormField(
                    controller: Provider.of<NgoLogin>(context, listen: false)
                        .emailOResnamecontroller,
                    validator: RequiredValidator(errorText: "Required"),
                    cursorColor: Colors.black,
                    style: const TextStyle(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: 'Username or Email',
                      fillColor: Colors.amber,
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                kheight30,
                SizedBox(
                  height: 8.h,
                  width: 80.w,
                  child: TextFormField(
                    controller: Provider.of<NgoLogin>(context, listen: false)
                        .passwordcontroller,
                    validator: RequiredValidator(errorText: "Required"),
                    cursorColor: Colors.black,
                    style: const TextStyle(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: 'Password',
                      fillColor: Colors.amber,
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                kheight30,
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScreenforgotPassword()),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: textStyleFuc(
                          weight: FontWeight.w400,
                          color: Colors.blue,
                          size: 13),
                    )),
                kHeight15,
                SizedBox(
                    width: 80.w,
                    height: 5.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            bool loginsuccess = await Provider.of<NgoLogin>(
                                    context,
                                    listen: false)
                                .ngologin(context);
                            if (loginsuccess) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ScreenNgoMainpage(),
                                ),
                                (route) => false,
                              );
                            

                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                backgroundColor: kpink,
                                content:  Text("Login successfull",style: textStyleFuc(weight: FontWeight.w500, color: kwhite, size: 16),),
                              duration: Duration(seconds: 2),
                              )
                            );



                            } else {
                              // ignore: use_build_context_synchronously
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text(
                                      'Login faild please try again.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kpink, foregroundColor: kwhite),
                          child: Consumer<NgoLogin>(
                            builder: (context, value, _) {
                              return value.isLoading
                                  ?  SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: kwhite,
                                          strokeWidth: 2),
                                    )
                                  : const Text("Login");
                            },
                          ),
                        ),
                      ],
                    )),
                kHeight15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account",
                      style: textStyleFuc(
                          weight: FontWeight.w600, color: kBlack, size: 13),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LandingPages(),
                              ),
                              (route) => false);
                        },
                        child: Text(
                          "Signup",
                          style: textStyleFuc(
                              weight: FontWeight.w700,
                              color: Colors.blue,
                              size: 14),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
