import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/user_signup.dart';
import 'package:give_gobble/view/User/screenmain.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ScreenGetOtp extends StatefulWidget {
  const ScreenGetOtp({super.key});

  @override
  State<ScreenGetOtp> createState() => _ScreenGetOtpState();
}

class _ScreenGetOtpState extends State<ScreenGetOtp> {
  final formKey = GlobalKey<FormState>();
  late Timer _timer;
  int _secondsRemaining=120;

@override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  void startTimer(){
    _timer=Timer.periodic(const Duration(seconds: 1), (timer) { 
      setState(() {
        if(_secondsRemaining>0){
_secondsRemaining--;
        }else {
          _timer.cancel(); // Stop the timer when it reaches 0
        }
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Verify your Account ",
                    style: textStyleFuc(
                        weight: FontWeight.bold, color: kBlack, size: 30),
                  ),
                ),
                kheight30,
                kheight30,
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Consumer<UserProvider>(
                      builder: (context, value, _) {
                        return Text(
                          "Your OTP send to your given email",
                          style: textStyleFuc(
                              weight: FontWeight.w500, color: kBlack, size: 15),
                        );
                      },
                    )),
                kheight30,
                SizedBox(
                  width: 70.w,
                  child: Pinput(
                    key: formKey,
                    controller:
                        Provider.of<UserProvider>(context, listen: false)
                            .otpcontroller,
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                kheight30,
                kHeight15,
                ElevatedButton(
                  onPressed: () async {
                    String otp =
                        Provider.of<UserProvider>(context, listen: false)
                            .otpcontroller
                            .text;

                    bool isgetotp =
                        await Provider.of<UserProvider>(context, listen: false)
                            .registertwo(otp);
                    // Provider.of<UserProvider>(context, listen: false)
                    //     .otpcontroller
                    //     .clear();
                    if (isgetotp) {
                      // ignore: use_build_context_synchronously
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.SUCCES,
                        animType: AnimType.TOPSLIDE,
                        showCloseIcon: true,
                        title: "Awesome!",
                        desc: "Registration successfull",
                      ).show();

                      await Future.delayed(const Duration(seconds: 3));
                      // ignore: use_build_context_synchronously
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenMainPage(),
                          ),
                          (route) => false);
                    } else {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Otp verification faild.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }

                    // ignore: use_build_context_synchronously
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kpink, foregroundColor: kwhite),
                  child: Consumer<UserProvider>(
                    builder: (context, value, child) {
                      return value.isotpLoading
                          ? SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: kwhite,
                              ),
                            )
                          : const Text("Register");
                    },
                  ),
                ),
                kheight30,
                kheight30,
                 Text("Resend code in ${_secondsRemaining} second"),
                kheight30,
                Text(
                  "Didn't recevied code?",
                  style: textStyleFuc(
                      weight: FontWeight.w700, color: kpink, size: 14),
                ),
                                    Lottie.asset("assets/animation/animation_llbxct8x.json",height: 300,width: 300)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
