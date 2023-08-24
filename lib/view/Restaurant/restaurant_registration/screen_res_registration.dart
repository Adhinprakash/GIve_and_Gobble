import 'package:flutter/material.dart';
import 'package:give_gobble/controller/provider/restarant_signup.dart';
import 'package:give_gobble/view/Restaurant/restaurant_registration/screen_res_otp_page.dart';
import 'package:provider/provider.dart';

import '../../../controller/consts/const.dart';

class ScreenResRegistration extends StatefulWidget {
  const ScreenResRegistration({super.key});

  @override
  State<ScreenResRegistration> createState() => _ScreenResRegistrationState();
}

class _ScreenResRegistrationState extends State<ScreenResRegistration> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  "Register Restaurant",
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: kBlack, size: 22),
                ),
                kheight30,
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 370,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'confirm restaurant name';
                            }
                            return null;
                          },
                          controller: Provider.of<RestaurantProvider>(context,
                                  listen: false)
                              .resnamecontroller,
                          cursorColor: Colors.black,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            labelText: 'Restaurant Name',
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      kheight30,
                      SizedBox(
                        height: 70,
                        width: 370,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'confirm email';
                            }
                            return null;
                          },
                          controller: Provider.of<RestaurantProvider>(context,
                                  listen: false)
                              .emailcontroller,
                          cursorColor: Colors.black,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: kBlack),
                            ),
                          ),
                        ),
                      ),
                      kheight30,
                      SizedBox(
                        height: 70,
                        width: 370,
                        child: TextFormField(
                          validator:
                             (value) {
                            if (value!.isEmpty) {
                              return 'please enter your location';
                            }
                            return null;
                          },
                          controller: Provider.of<RestaurantProvider>(context,
                                  listen: false)
                              .locationcontroller,
                          cursorColor: Colors.black,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            labelText: 'Location',
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      kheight30,
                      SizedBox(
                        height: 70,
                        width: 370,
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'confirm password';
                            }
                            return null;
                          },
                          controller: Provider.of<RestaurantProvider>(context,
                                  listen: false)
                              .passwordcontroller,
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
                      ),
                      kheight30,
                 
                    ],
                  ),
                ),
                kheight30,
                SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () async {
                        if(_formkey.currentState!.validate()){
                               bool isregister = await Provider.of<RestaurantProvider>(
                                context,
                                listen: false)
                            .resregister(context);
                        if (isregister) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScreenResOtp()),
                          );
                        } else {
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'An error occurred. Please try again later.'),
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
                      child: Consumer<RestaurantProvider>(
                        builder: (context, value, child) {
                          return value.isLoading
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
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
