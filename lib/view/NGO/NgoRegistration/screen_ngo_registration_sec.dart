import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:sizer/sizer.dart';

class ScreenScecondPage extends StatefulWidget {
  const ScreenScecondPage({super.key});

  @override
  State<ScreenScecondPage> createState() => _ScreenScecondPageState();
}

class _ScreenScecondPageState extends State<ScreenScecondPage> {
      final _formkey = GlobalKey<FormState>();
    
  final _emailcontroller = TextEditingController();
     final _password = TextEditingController();
        final _confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [                   
             Form(
                key:_formkey ,
                child:  Column(
                  children: [
                      Text("Register NGO",style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 23),),
                kheight30,
                kheight30,
                        SizedBox(
                            height: 70.sp,
                            width: 370.sp,
                            child: TextFormField(
                              controller: _emailcontroller,
                              validator: RequiredValidator(errorText: "Required"),
                              
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
                          ),
                          kheight30,
                            SizedBox(
                            height: 70.sp,
                            width: 370.sp,
                            child: TextFormField(
                              controller: _password,
                              validator: RequiredValidator(errorText: "Required"),
                              
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
                            height: 70.sp,
                            width: 370.sp,
                            child: TextFormField(
                              controller: _confirmpassword,
                              validator: RequiredValidator(errorText: "Required"),
                              
                              cursorColor: Colors.black,
                              style: const TextStyle(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                labelText: 'confirm password',
                                labelStyle: const TextStyle(color: Colors.black),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          kheight30,
                              Row(
                                children: [
                                   SizedBox(
                    
                      width: 200.sp,
                      child: ElevatedButton(
                        
                        onPressed: ()  {
                           Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          
                           foregroundColor: kpink),
                        child: const Text("back"),
                      )),
                      kwidth15,
                                  SizedBox(
                    width: 200,
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const ),
                          // );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kpink, foregroundColor: kwhite),
                      child: const Text("Register"),
                    )),
                                ],
                              )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}