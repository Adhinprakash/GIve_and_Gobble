
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/NGO/screencompleted/widgets/completed_listwidget.dart';
import 'package:give_gobble/view/User/widgets/commonappbar.dart';

class ScreenCompleted extends StatelessWidget {
  const ScreenCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(

      child: Scaffold(
        body: Column(
       
          children: [
            CommonAppbarwidget(title: "Completed", leading: Icons.arrow_back, color: Colors.black, buttoncolor: kBlack),
         const Expanded(child: Completedlistwidget(
        food: "Paneer Masala",
        people: "food for 30 people",
        time: "cooking time: 10:44 PM",
        location: "Kakkanjery,kerala,43473",
        chat:Icons.message_sharp ,
         ))
          ],
        ),
      ),
    );
  }
}