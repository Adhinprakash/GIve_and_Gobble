import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/restaurant_login.dart';
import 'package:give_gobble/view/Restaurant/forgot_password/screen_res_forgot_password.dart';
import 'package:give_gobble/view/Restaurant/screen_main.dart';
import 'package:give_gobble/view/landingpages/landing_pages.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ScreenRestaurantLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ScreenRestaurantLogin({super.key});

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
                      controller: Provider.of<ResLogin>(context, listen: false)
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
                      controller: Provider.of<ResLogin>(context, listen: false)
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
                                  const ScreenResforgotPassword()),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 25.w,
                          height: 5.h,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool isloginsuccess = await Provider.of<ResLogin>(
                                        context,
                                        listen: false)
                                    .restaurantlogin(context);
                                if (isloginsuccess) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ScreenResMainPage(),
                                    ),
                                    (route) => false,
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

                                  // ignore: use_build_context_synchronously
                                  Provider.of<ResLogin>(context, listen: false)
                                      .emailOResnamecontroller
                                      .clear();
                                  // ignore: use_build_context_synchronously
                                  Provider.of<ResLogin>(context, listen: false)
                                      .passwordcontroller
                                      .clear();
                                } else {
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Error'),
                                      content: const Text(
                                          'An error occurred. Please try again later.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }
                              // Provider.of<ResLogin>(context,listen: false).restaurantlogin(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kpink, foregroundColor: kwhite),
                            child: Consumer<ResLogin>(
                              builder: (context, value, _) {
                                return value.isLoading
                                    ? SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: kwhite,
                                        ),
                                      )
                                    : const Text("Login");
                              },
                            ),
                          )),

                                   ElevatedButton(onPressed: (){

                             Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ScreenResMainPage(),
                                        )
                                      
                                      );
                           }, child:  Text("Guest mode"),style:ElevatedButton.styleFrom(
                                    backgroundColor: kpink,
                                    foregroundColor: kwhite),)
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
