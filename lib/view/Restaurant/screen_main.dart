
import 'package:flutter/material.dart';
import 'package:give_gobble/view/Restaurant/restaurant_donation/screen_res_donation.dart';
import 'package:give_gobble/view/Restaurant/restaurant_history/screen_res_history.dart';
import 'package:give_gobble/view/Restaurant/restaurant_mainpage/screenhome.dart';
import 'package:give_gobble/view/Restaurant/restaurant_profile/screen_res_profile.dart';
import 'package:give_gobble/view/Restaurant/widgets/screen_bottomnav.dart';

class ScreenResMainPage extends StatelessWidget {
  ScreenResMainPage({super.key});
  final pages = [
    ScreenHomeRestaurant(),
    ScreenRestaurantDonation(),
    ScreenResHistory(),
   ScreenProfileRes (),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
      
          child: ValueListenableBuilder(
        valueListenable:indexchangingnotifier ,
        builder: (context, index, _) {
          return pages[index];
        },
      )),
      bottomNavigationBar: const ResBottomNavigationWidget(),
    );
  }
}
