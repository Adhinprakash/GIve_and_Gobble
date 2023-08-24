import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/user_login.dart';
import 'package:give_gobble/view/User/screenmain.dart';
import 'package:give_gobble/view/landingpages/landing_pages.dart';
import 'package:give_gobble/view/login/forgotpassword/screen_forgotpassword.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      controller: Provider.of<UserLogin>(context, listen: false)
                          .emailOrusernamecontroller,
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
                      controller: Provider.of<UserLogin>(context, listen: false)
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
                                  const ScreenforgotPassword()),
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
                              if (_formKey.currentState!.validate()) {
                                int loginsuccess = await Provider.of<UserLogin>(
                                        context,
                                        listen: false)
                                    .userlogin(context);
                                if (loginsuccess == 201) {
                                  // ignore: use_build_context_synchronously

                                  // ignore: use_build_context_synchronously
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ScreenMainPage(),
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
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kpink,
                                foregroundColor: kwhite),
                            child: Consumer<UserLogin>(
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
      ),
    );
  }
}
