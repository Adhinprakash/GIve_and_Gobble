import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/NGO/NgoRegistration/screen_ngo_registration_sec.dart';
import 'package:sizer/sizer.dart';


class ScreenNgoRegistration extends StatefulWidget {
  const ScreenNgoRegistration({super.key});

  @override
  State<ScreenNgoRegistration> createState() => _ScreenNgoRegistrationState();
}

class _ScreenNgoRegistrationState extends State<ScreenNgoRegistration> {
    final _formkey = GlobalKey<FormState>();
  final _namecontroller = TextEditingController();
  final _ngotype = TextEditingController();
  final _pincodecontroller = TextEditingController();
  final _adresscontroller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  const EdgeInsets.all(20),
          child: ListView(
            children:  [
           Form(
            key: _formkey,
             child: Column(
              children: [
                Text("Register NGO",style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 23),),
                kheight30,
                kheight30,
                  SizedBox(
                        height: 70.sp,
                        width: 370.sp,
                        child: TextFormField(
                          controller: _namecontroller,
                          validator: RequiredValidator(errorText: "Required"),
                          
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
                      )
              ,kheight30,
                SizedBox(
                        height: 70.sp,
                        width: 370.sp,
                        child: TextFormField(
                          controller: _ngotype,
                          validator: RequiredValidator(errorText: "Required"),
                          
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
                      )
              ,kheight30,
                SizedBox(
                        height: 70.sp,
                        width: 370.sp,
                        child: TextFormField(
                          controller: _pincodecontroller,
                          validator: RequiredValidator(errorText: "Required"),
                          
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
                      )
              ,kheight30,
                SizedBox(
                        height: 70.sp,
                        width: 370.sp,
                        child: TextFormField(
                         controller: _adresscontroller,
                          validator: RequiredValidator(errorText: "Required"),
                          
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
                      )
             ,kheight30,
                     
             Row(
               children: [
                SizedBox(
                    
                      width: 200,
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
                       
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ScreenScecondPage()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kpink, foregroundColor: kwhite),
                        child: const Text("Next"),
                      )),
               ],
             )
              ]
             ),
           )
            ],
          ),
        ),
      ),
    );
  }
}