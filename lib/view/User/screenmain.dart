import 'package:flutter/material.dart';
import 'package:give_gobble/view/User/user_donation/screen_donation.dart';
import 'package:give_gobble/view/User/user_history/screen_history.dart';
import 'package:give_gobble/view/User/user_mainpage/screen_home.dart';
import 'package:give_gobble/view/User/user_profile/screen_profile.dart';
import 'package:give_gobble/view/User/widgets/screen_bottomnav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final pages = [
    const ScreenHome(),
    const ScreenDonation(),
    const ScreenHistory(),
    const ScreenProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: indexchangenotifier,
        builder: (context, index, _) {
          return pages[index];
        },
      )),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
