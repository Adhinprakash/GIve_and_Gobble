import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/User/widgets/commonappbar.dart';

class ScreenEditprofile extends StatefulWidget {
  const ScreenEditprofile({super.key});

  @override
  State<ScreenEditprofile> createState() => _ScreenEditprofileState();
}

class _ScreenEditprofileState extends State<ScreenEditprofile> {
  final _formkey = GlobalKey<FormState>();
  final _namecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _placecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppbarwidget(
                title: "Edit Profile",
                leading: Icons.arrow_back,
                color: kBlack,
                buttoncolor: kBlack),
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 30.0,
                        right: 30.0,
                        bottom: 20.0,
                      ),
                      child: TextFormField(
                        validator: RequiredValidator(errorText: "Required"),
                        controller: _namecontroller,
                        cursorColor: Colors.black,
                        style: const TextStyle(),
                        decoration: const InputDecoration(
                          labelText: 'User name',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 30.0,
                        right: 30.0,
                        bottom: 20.0,
                      ),
                      child: TextFormField(
                        maxLength: 10,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Phonenumber required"),
                          MaxLengthValidator(10,
                              errorText:
                                  "Phonenumber must contain 10 charecters")
                        ]),
                        controller: _phonecontroller,
                        cursorColor: Colors.black,
                        style: const TextStyle(),
                        decoration: const InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 30.0,
                        right: 30.0,
                        bottom: 20.0,
                      ),
                      child: TextFormField(
                        controller: _placecontroller,
                        cursorColor: Colors.black,
                        style: const TextStyle(),
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            kHeight15,
            Center(
                child: SizedBox(
                    width: 400,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }

                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: kwhite,
                            content: const Text(
                              'Validation Successful',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: kpurple),
                      child: Text(
                        "Post",
                        style: textStyleFuc(
                            weight: FontWeight.w500,
                            color: Colors.white,
                            size: 22),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
