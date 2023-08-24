import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/ngo_signup.dart';
import 'package:give_gobble/view/login/screen_ngo_login.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ScreenNgoOtp extends StatefulWidget {
  const ScreenNgoOtp({super.key});

  @override
  State<ScreenNgoOtp> createState() => _ScreenNgoOtpState();
}

class _ScreenNgoOtpState extends State<ScreenNgoOtp> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
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
                    child: Consumer<NgoProvider>(
                      builder: (context, value, _) {
                        return Text(
                          "Your OTP send to adhinprakash@gmail.com this number",
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
                    controller: Provider.of<NgoProvider>(context, listen: false)
                        .otpcontroller,
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                kheight30,
                kHeight15,
          ElevatedButton(
  onPressed: () async {
    int registrationResult = await Provider.of<NgoProvider>(context, listen: false).ngoregistertwo();

    if (registrationResult == 400) {
      // Handle error with an AwesomeDialog
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,
        showCloseIcon: true,
        title: "Error!",
        desc: "Otp verification failed",
      ).show();
    } else if (registrationResult == 201) {
      // Handle successful registration with an AwesomeDialog
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.TOPSLIDE,
        showCloseIcon: true,
        title: "Awesome!",
        desc: "Otp verified",
      ).show();

      await Future.delayed(const Duration(seconds: 3));
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ScreenNgoLogin()),
        (route) => false,
      );
    } else {
      // Handle other errors with a simple AlertDialog
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Otp verification failed.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: kpink,
    foregroundColor: kwhite,
  ),
  child: Consumer<NgoProvider>(
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
                const Text("Resend code in 10 second"),
                kheight30,
                Text(
                  "Didn't recevied code?",
                  style:  textStyleFuc(
                      weight: FontWeight.w700, color: kpink, size: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
