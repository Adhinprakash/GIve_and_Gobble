import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/NGO/Ngoprofile/screenprofile.dart';
import 'package:give_gobble/view/NGO/screenchat/screenchat.dart';
import 'package:give_gobble/view/NGO/screencompleted/screen_completed.dart';
import 'package:give_gobble/view/NGO/screenhome/screen_home.dart';
import 'package:give_gobble/view/NGO/widgets/bottom_nav_ngo.dart';

class ScreenNgoMainpage extends StatelessWidget {
  ScreenNgoMainpage({super.key});
  final pages = [
    const ScreenHomeNgo(),
   const ScreenNgoChat(),
    const ScreenCompleted(),
    const ScreenNgoProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        
          child: ValueListenableBuilder(
        valueListenable: channgeindexnotifier,
        builder: (context, index, _) {
          return pages[index];
        },
      )),
      bottomNavigationBar: const BottomNavigationWidgetNgo(),
    );
  }
}
