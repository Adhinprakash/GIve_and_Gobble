import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/login/forgotpassword/screen_forgotpassword.dart';
import 'package:sizer/sizer.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

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
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                                     Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const ScreenforgotPassword()),
);
                        },
                        child: Text(
                          "Forgot Password?",
                          style: textStyleFuc(
                              weight: FontWeight.w400,
                              color: Colors.blue,
                              size: 13),
                        ))),
                        kHeight15,
                SizedBox(
                    width: 70.w,
                    height: 5.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kpink, foregroundColor: kwhite),
                      child: const Text("Login"),
                    )),
                     kHeight15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account",style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 13),),
                        TextButton(onPressed: (){}, child: Text("Signup",style: textStyleFuc(weight: FontWeight.w700, color: Colors.blue, size: 14),))
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
