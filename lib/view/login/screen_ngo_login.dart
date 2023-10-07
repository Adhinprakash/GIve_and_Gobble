import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/ngo_login.dart';
import 'package:give_gobble/view/NGO/screenmain.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../NGO/ngo_forgotpassword/screen_ngo_forgot_password.dart';
import '../landingpages/landing_pages.dart';

class ScreenNgoLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ScreenNgoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: ListView(
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Username or Email';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
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
                              builder: (context) =>
                                  const ScreenNgoforgotPassword()),
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
                  Row(
                    children: [
                      SizedBox(
                          width: 50.w,
                          height: 5.h,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  // Validate the form before attempting to login
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, perform the login process

                                    int loginsuccess = await Provider.of<NgoLogin>(
                                            context,
                                            listen: false)
                                        .ngologin(context);

                                    if (loginsuccess == 401) {
                                      // Display a warning dialog if the login fails due to verification
                                      // ignore: use_build_context_synchronously
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.WARNING,
                                        animType: AnimType.TOPSLIDE,
                                        showCloseIcon: true,
                                        title: "Warning!",
                                        desc:
                                            "Your account is under verification, it will be activated within 24 hours.",
                                      ).show();
                                    } else if (loginsuccess == 403) {
                                      // Display an error dialog if the login fails due to account rejection
                                      // ignore: use_build_context_synchronously
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.ERROR,
                                        animType: AnimType.TOPSLIDE,
                                        showCloseIcon: true,
                                        title: "Rejected!",
                                        desc:
                                            "Your account has been rejected by the admin. Please remove the account and try again.",
                                      ).show();
                                    } else if (loginsuccess == 201) {
                                        Provider.of<NgoLogin>(context, listen: false)
                                      .emailOResnamecontroller
                                      .clear();
                                  // ignore: use_build_context_synchronously
                                  Provider.of<NgoLogin>(context, listen: false)
                                      .passwordcontroller
                                      .clear();
                                      // If the login is successful, navigate to the main page
                                      // ignore: use_build_context_synchronously

                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ScreenNgoMainpage(),
                                        ),
                                      );

                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: kpink,
                                        content: Text(
                                          "Login successfull",
                                          style: textStyleFuc(
                                              weight: FontWeight.w500,
                                              color: kwhite,
                                              size: 16),
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ));
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kpink,
                                    foregroundColor: kwhite),
                                child: Consumer<NgoLogin>(
                                  builder: (context, value, _) {
                                    return value.isLoading
                                        ? SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: CircularProgressIndicator(
                                                color: kwhite, strokeWidth: 2),
                                          )
                                        : const Text("Login");
                                  },
                                ),
                              )
                            ],
                          )),

                                       ElevatedButton(onPressed: (){

                             Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ScreenNgoMainpage(),
                                        )
                                      
                                      );
                           }, child:  Text("Guest mode"),style:ElevatedButton.styleFrom(
                                    backgroundColor: kpink,
                                    foregroundColor: kwhite),),
                    ],
                  ),
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
      ),
    );
  }
}
