import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/user_login.dart';
import 'package:give_gobble/controller/provider/user_signup.dart';
import 'package:give_gobble/view/User/user_profile/screen_editprofile.dart';
import 'package:give_gobble/view/User/user_profile/widgets/profile_details_widget.dart';
import 'package:give_gobble/view/landingpages/landing_pages.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<UserProvider>(
          builder: (context, profilenotifier, _) {
            return ListView(children: [
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
                                child: 
                                
                                
                                Image.network(
                                  
                                
                                  profilenotifier.userdetils
                                    .firstWhere((item) =>
                                        item['key'] == 'profile')['value']!)),
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
                          profilenotifier.userdetils.firstWhere(
                              (item) => item['key'] == 'username')['value']!,
                          style: textStyleFuc(
                              weight: FontWeight.w600, color: kBlack, size: 16),
                        ),
                        Text(
                          profilenotifier.userdetils.firstWhere(
                              (item) => item['key'] == 'role')['value']!,
                          style: textStyleFuc(
                              weight: FontWeight.w300,
                              color: kBlack38,
                              size: 14),
                        )
                      ],
                    ),
                  ),
                  kheight30,
                  Container(
                    width: double.infinity,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Profiledetails(
                              icon: Icons.location_on_outlined,
                              text: "Address"),
                          Text(
                            profilenotifier.userdetils.firstWhere(
                                (item) => item['key'] == 'location')['value']!,
                            style: textStyleFuc(
                                weight: FontWeight.w500,
                                color: kpink,
                                size: 15),
                          ),
                          const Profiledetails(
                              icon: Icons.email_outlined, text: "Email"),
                          Text(
                            profilenotifier.userdetils.firstWhere(
                                (item) => item['key'] == 'email')['value']!,
                            style: textStyleFuc(
                                weight: FontWeight.w500,
                                color: kBlack,
                                size: 15),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]);
          },
        ),
      ),
    );
  }
}
