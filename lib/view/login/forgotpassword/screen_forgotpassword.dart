import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/login/forgotpassword/screen_otp_field.dart';

class ScreenforgotPassword extends StatelessWidget {
  const ScreenforgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 45, top: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot Password?",
                style: textStyleFuc(
                    weight: FontWeight.bold, color: kBlack, size: 30),
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                style: textStyleFuc(
                    weight: FontWeight.w500, color: kBlack, size: 17),
              ),
              kheight30,
              kheight30,
              SizedBox(
                height: 70,
                width: 370,
                child: TextFormField(
                  validator: RequiredValidator(errorText: "Required"),
                  cursorColor: Colors.black,
                  style: const TextStyle(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    labelText: 'Enter your Email ID',
                    labelStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
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
                    onPressed: () {
                                                        Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const ScreenOtp()),
);
         
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kpink, foregroundColor: kwhite),
                    child: const Text("Send OTP"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
