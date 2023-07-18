
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/Restaurant/widgets/common_appbarwidget.dart';
import 'package:give_gobble/view/Restaurant/widgets/list_widget.dart';

class ScreenResHistory extends StatelessWidget {
  const ScreenResHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [
        RestCommonAppbarwidget(title: "History", leading: Icons.arrow_back, color: Colors.black, buttoncolor: kBlack),
   const Expanded(child: ListWidget(
    food: "Paneer Masala",
    people: "food for 30 people",
    time: "cooking time: 10:44 PM",
    location: "Kakkanjery,kerala,43473",
    chat:Icons.message_sharp ,
   ))
      ],
    );
  }
}