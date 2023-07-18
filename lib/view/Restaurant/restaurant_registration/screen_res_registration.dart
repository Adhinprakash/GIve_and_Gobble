import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:give_gobble/view/Restaurant/restaurant_login/screen_res_login.dart';

import '../../../controller/consts/const.dart';

class ScreenResRegistration extends StatefulWidget {
  const ScreenResRegistration({super.key});

  @override
  State<ScreenResRegistration> createState() => _ScreenResRegistrationState();
}

class _ScreenResRegistrationState extends State<ScreenResRegistration> {
  final _formkey = GlobalKey<FormState>();
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _locationcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpassword = TextEditingController();

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
                          validator: RequiredValidator(errorText: "Required"),
                          controller: _namecontroller,
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
                      ),
                      kheight30,
                      SizedBox(
                        height: 70,
                        width: 370,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            EmailValidator(
                                errorText: "Please enter a valid email address"),
                          ]),
                          controller: _emailcontroller,
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
                              RequiredValidator(errorText: "Required Location"),
                          controller: _locationcontroller,
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
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            MinLengthValidator(6,
                                errorText:
                                    "Password must contain atleast 6 characters"),
                            MaxLengthValidator(15,
                                errorText:
                                    "Password cannot be more 15 characters"),
                          ]),
                          controller: _passwordcontroller,
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
                      SizedBox(
                        height: 70,
                        width: 370,
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required Password")
                          ]),
                          keyboardType: TextInputType.visiblePassword,
                          controller: _confirmpassword,
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
                      ),
                    ],
                  ),
                ),
                kheight30,
                SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            animType: AnimType.TOPSLIDE,
                            showCloseIcon: true,
                            title: "Awesome!",
                            desc: "Registration successfull",
                          ).show();
          
                          await Future.delayed(const Duration(seconds: 2));
          
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScreenResLogin()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kpink, foregroundColor: kwhite),
                      child: const Text("Registration"),
                    ))
              ],
            ),
                  ],
                ),
          )),
    );
  }
}
