import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/res_forgot_password.dart';
import 'package:give_gobble/view/login/screen_res_login.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ScreenResetpassword extends StatelessWidget {
  const ScreenResetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 40,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create new Password",
                  style: textStyleFuc(
                      weight: FontWeight.bold, color: kBlack, size: 24),
                ),
                Lottie.asset('assets/animation/animation_lkzmtbk4.json',
                    height: 300, width: 300),
                Center(
                  child: Text(
                    "Your New Password Must be different\n from previously used password ",
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 17),
                  ),
                ),
                kheight30,
                kheight30,
                SizedBox(
                  height: 8.h,
                  width: 80.w,
                  child: TextFormField(
                    controller:
                        Provider.of<ResForgotpassword>(context, listen: false)
                            .resemailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: 'Enter your email',
                      fillColor: Colors.amber,
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                  width: 80.w,
                  child: TextFormField(
                    controller:
                        Provider.of<ResForgotpassword>(context, listen: false)
                            .newpasswordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: 'Enter new password',
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
                kheight30,
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(2)),
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          int isverify = await Provider.of<ResForgotpassword>(
                                  context,
                                  listen: false)
                              .savePassword();

                          if (isverify == 201) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenRestaurantLogin(),
                              ),
                              (route) => false,
                            );
                          } else if (isverify == 401) {
                            // ignore: use_build_context_synchronously
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content: const Text('Enter a valid otp'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Oops!'),
                                content: const Text('Internal server error'),
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
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kpink, foregroundColor: kwhite),
                      child: const Text("Save"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
