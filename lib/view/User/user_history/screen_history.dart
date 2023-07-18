import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/User/widgets/commonappbar.dart';
import 'package:give_gobble/view/User/widgets/listviewbuilder_widget.dart';

class ScreenHistory extends StatelessWidget {
  const ScreenHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [
        CommonAppbarwidget(title: "History", leading: Icons.arrow_back, color: Colors.black, buttoncolor: kBlack),
   const Expanded(child: ListViewBuilderWidget(
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