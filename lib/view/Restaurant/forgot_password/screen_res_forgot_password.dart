import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/res_forgot_password.dart';
import 'package:give_gobble/view/Restaurant/forgot_password/screen_res_otp_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ScreenResforgotPassword extends StatelessWidget {
  const ScreenResforgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 45, top: 120),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot Password?",
                  style: textStyleFuc(
                      weight: FontWeight.bold, color: kBlack, size: 30),
                ),
                Text(
                  "Enter the email address assosiated with your account",
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kBlack, size: 17),
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
                              .enterOtp();

                          if (isverify == 200) {
                            // ignore: use_build_context_synchronously
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.TOPSLIDE,
                              showCloseIcon: true,
                              title: "Awesome!",
                              desc: "Registration successfull",
                            ).show();

                            await Future.delayed(const Duration(seconds: 4));
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ScreenOtp()),
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
                      child: const Text("Send OTP"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
