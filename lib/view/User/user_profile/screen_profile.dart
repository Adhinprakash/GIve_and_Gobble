import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/User/user_profile/screen_editprofile.dart';
import 'package:give_gobble/view/User/user_profile/widgets/profile_details_widget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Profile",
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: kwhite, size: 28),
                  ),
                  IconButton(
                    color: kwhite,
                    onPressed: () {},
                    icon: Icon(
                      Icons.logout,
                    ),
                    iconSize: 25,
                  ),
                ],
              ),
              kheight30,
              Container(
                width: 350,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: const Offset(0, 4)),
                    ]),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                            width: 160,
                            height: 160,
                            child: Image.asset(
                              "assets/valunteer-removebg-preview (1).png",
                            )),
                        Positioned(
                            bottom: 0,
                            right: 20,
                            child: CircleAvatar(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenEditprofile()),
                                  );
                                },
                                child: const SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Icon(Icons.edit)),
                              ),
                            ))
                      ],
                    ),
                    Text(
                      "Adhin prakash",
                      style: textStyleFuc(
                          weight: FontWeight.w600, color: kBlack, size: 16),
                    ),
                    Text(
                      "User",
                      style: textStyleFuc(
                          weight: FontWeight.w300, color: kBlack38, size: 14),
                    )
                  ],
                ),
              ),
              kheight30,
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Profiledetails(
                          icon: Icons.location_on_outlined, text: "Address"),
                      Text(
                        "add address",
                        style: textStyleFuc(
                            weight: FontWeight.w500, color: kpink, size: 15),
                      ),
                      const Profiledetails(
                          icon: Icons.phone_android_outlined, text: "Mobile"),
                      Text(
                        "add address",
                        style: textStyleFuc(
                            weight: FontWeight.w500, color: kBlack, size: 15),
                      ),
                      const Profiledetails(
                          icon: Icons.email_outlined, text: "+91-7049349043"),
                      Text(
                        "adhinprakash70@gmail.com",
                        style: textStyleFuc(
                            weight: FontWeight.w500, color: kBlack, size: 15),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
  