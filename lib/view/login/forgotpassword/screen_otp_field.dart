import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:pinput/pinput.dart';

class ScreenOtp extends StatelessWidget {
  const ScreenOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  const EdgeInsets.all(20),
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
                 Text(
                    "Forgot Password?",
                    style: textStyleFuc(
                        weight: FontWeight.bold, color: kBlack, size: 30),
        
                  ),
        
                  kheight30,
                  kheight30,
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Your OTP send to adhinprakash70@gmail.com this number",
                      style: textStyleFuc(
                          weight: FontWeight.w500, color: kBlack, size: 15),
                    ),
                  ),
                  kheight30,
   const SizedBox(
 width: 400,
 child: Pinput(
  length: 4,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 ),
   ),
                    
                      kheight30,
                     kheight30,
                      const Text("Resend code in 10 second"),
                      kheight30,
                      kheight30,
                      Text("Didn't recevied code?",style: textStyleFuc(weight: FontWeight.w700, color: kpink, size: 14),)

            ],
          ),
        ),
      ),
    );
  }
}