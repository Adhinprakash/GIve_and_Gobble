import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/ngo_signup.dart';
import 'package:give_gobble/view/NGO/ngoregistration/screen_ngo_otp_page.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ScreenNgoRegistration extends StatefulWidget {
  const ScreenNgoRegistration({super.key});

  @override
  State<ScreenNgoRegistration> createState() => _ScreenNgoRegistrationState();
}

class _ScreenNgoRegistrationState extends State<ScreenNgoRegistration> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ListView(
              children: [
                Column(children: [
                  Text(
                    "Register NGO",
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: kBlack, size: 23),
                  ),
                  kheight30,
                  kheight30,
                  TextFormField(
                    controller: Provider.of<NgoProvider>(context, listen: false)
                        .ngonamecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Ngo name ';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: 'Name',
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  kheight30,
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ngo type required';
                      }
                      return null;
                    },
                    controller: Provider.of<NgoProvider>(context, listen: false)
                        .ngotypecontroller,
                    cursorColor: Colors.black,
                    style: const TextStyle(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: 'Select NGO type',
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  kheight30,
                  TextFormField(
                    controller: Provider.of<NgoProvider>(context, listen: false)
                        .pincodecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Pincode required';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: 'Pincode',
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  kheight30,
                  TextFormField(
                    controller: Provider.of<NgoProvider>(context, listen: false)
                        .locationcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter your address';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: 'Enter your Address',
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  kheight30,
                  TextFormField(
                    controller: Provider.of<NgoProvider>(context, listen: false)
                        .emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: 'Enter your email',
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  kheight30,
                  TextFormField(
                    controller: Provider.of<NgoProvider>(context, listen: false)
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
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  kheight30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 40.w,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: kpink),
                            child: const Text("back"),
                          )),
                      kwidth15,
                      SizedBox(
                          width: 40.w,
                          child: Consumer<NgoProvider>(
                            builder: (context, value, child) {
                              return ElevatedButton(
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    bool isregister =
                                        await Provider.of<NgoProvider>(context,
                                                listen: false)
                                            .ngoregister();
                                    if (isregister) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                // ignore: prefer_const_constructors
                                                ScreenNgoOtp()),
                                      );
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('Error'),
                                          content: Text(
                                            value.errormsg,
                                            style: textStyleFuc(
                                                weight: FontWeight.normal,
                                                color: kBlack,
                                                size: 14),
                                          ),
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
                                child: Consumer<NgoProvider>(
                                  builder: (context, value, _) {
                                    return value.isotpLoading
                                        ? SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: CircularProgressIndicator(
                                                color: kwhite, strokeWidth: 2),
                                          )
                                        : const Text("Register");
                                  },
                                ),
                              );
                            },
                          )),
                    ],
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
