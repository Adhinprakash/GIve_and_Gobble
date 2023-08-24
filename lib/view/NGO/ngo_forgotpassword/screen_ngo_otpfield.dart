import 'dart:async';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/ngo_forgot_password.dart';
import 'package:give_gobble/view/NGO/ngo_forgotpassword/screen_ngo_reset_password.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class ScreenNgoOtp extends StatefulWidget {
  const ScreenNgoOtp({super.key});

  @override
  State<ScreenNgoOtp> createState() => _ScreenNgoOtpState();
}

class _ScreenNgoOtpState extends State<ScreenNgoOtp> {
    final _formKey = GlobalKey<FormState>();
late Timer _timer;
int _secondsRemaining=120;

@override
  void initState() {
    startTimer();
    super.initState();
  }
 void  startTimer(){
  _timer=Timer.periodic(const Duration(seconds: 1), (timer) {
    setState(() {
      if(_secondsRemaining>0){
        _secondsRemaining--;
      }else{
        _timer.cancel();
      }
    });
   });

   
 }
 @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: textStyleFuc(
                          weight: FontWeight.bold, color: kBlack, size: 25),
                    ),
                    Lottie.asset("assets/animation/animation_lkzkqim8.json",
                        height: 200, width: 200),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        "Enter the otp code we just sent to your Email adderss",
                        style: textStyleFuc(
                            weight: FontWeight.w500, color: kBlack, size: 15),
                      ),
                    ),
                    kheight30,
                    SizedBox(
                      width: 400,
                      child: Pinput(
                        controller: Provider.of<NgoForgotpassword>(context,
                                listen: false)
                            .otpcontroller,
                        length: 6,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                    kheight30,
                    kheight30,
                     Text("Resend code in ${_secondsRemaining} second"),
                    kheight30,
                    kheight30,
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2)),
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              int getotp = await Provider.of<NgoForgotpassword>(
                                      context,
                                      listen: false)
                                  .confirmOtp();

                              if (getotp == 200) {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ScreenNgoResetpassword()),
                                );
                              } else if (getotp == 400) {
                                // ignore: use_build_context_synchronously
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Oops!'),
                                    content: const Text('Given otp is invalid'),
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
                        )),
                    Text(
                      "Didn't recevied code?",
                      style: textStyleFuc(
                          weight: FontWeight.w700, color: kpink, size: 14),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
