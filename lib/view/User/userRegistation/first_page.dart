import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/user_signup.dart';
import 'package:give_gobble/view/User/userRegistation/widgets/Screen_otp_page.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ScreenRegistration extends StatefulWidget {
  const ScreenRegistration({super.key});

  @override
  State<ScreenRegistration> createState() => _ScreenRegistrationState();
}

class _ScreenRegistrationState extends State<ScreenRegistration> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: _formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                      "Register User",
                      style: textStyleFuc(
                          weight: FontWeight.w600, color: kBlack, size: 22),
                    ),
                    kheight30,
                    Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your name';
                            }
                            return null;
                          },
                          controller:
                              Provider.of<UserProvider>(context, listen: false)
                                  .namecontroller,
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
                              return 'Email is required';
                            }
                            return null;
                          },
                          controller:
                              Provider.of<UserProvider>(context, listen: false)
                                  .emailcontroller,
                          cursorColor: Colors.black,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: kBlack),
                            ),
                          ),
                        ),
                        kheight30,
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'location is required';
                            }
                            return null;
                          },
                          controller:
                              Provider.of<UserProvider>(context, listen: false)
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
                        kheight30,
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a password ';
                            }
                            return null;
                          },
                          controller:
                              Provider.of<UserProvider>(context, listen: false)
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
                        kheight30,
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'confirm password';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          controller:
                              Provider.of<UserProvider>(context, listen: false)
                                  .confirmpassword,
                          cursorColor: Colors.black,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Confirm password',
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: kBlack),
                            ),
                          ),
                        ),
                      ],
                    ),
                    kheight30,
                    Consumer<UserProvider>(
                      builder: (context, value, child) {
                        return Text(
                          value.errormsg,
                          style: textStyleFuc(
                              weight: FontWeight.w500,
                              color: Colors.red,
                              size: 13),
                        );
                      },
                    ),
                    kHeight15,
                    SizedBox(
                        width: 350.w,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              bool isregister = await Provider.of<UserProvider>(
                                      context,
                                      listen: false)
                                  .register(context);
                              if (isregister) {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ScreenGetOtp()),
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
                          child: Consumer<UserProvider>(
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
          ),
        ),
      )),
    );
  }
}
