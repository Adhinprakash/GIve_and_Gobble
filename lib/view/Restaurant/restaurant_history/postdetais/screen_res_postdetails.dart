
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/Restaurant/widgets/common_appbarwidget.dart';

class ResPostDetails extends StatelessWidget {
  const ResPostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          RestCommonAppbarwidget(title: "Post details", leading: Icons.arrow_back, color: kBlack, buttoncolor: kBlack),
          Container(
            width: 800,
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/Paneer masala.jfif"),fit:BoxFit.fill )
            ),
            ),
   

   Container(
    width: 800,
    height: 473,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Paneer Masala,Rotti,\n chawal ",style: textStyleFuc(weight:FontWeight.w700 , color: kBlack, size: 22),),
              Row(
                children: [
                        Row(children: [
                   Image.asset("assets/valunteer-removebg-preview (1).png",width: 60,height: 60,),
                   kwidth15,
                  Text(
                    "14's",
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: kBlack, size: 15),
                  )
                ]),

                ],
              ),
              kHeight15,
               Text(
                    "Cooking time",
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: kBlack, size: 15),),
                         const Text("2:59 PM"),
                         kheight30,
                         Text(
                    "Quantity",
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: kBlack, size: 15),),
                         const Text("food for 59 people"), 
                         kheight30,
                          Text(
                    " Address",
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: kBlack, size: 15),),
 const Text("Kakkanjery,kerala,676878"),
            ],
          ),
        ),
        Text("Open location in map",style: textStyleFuc(weight: FontWeight.w400, color: kpink, size: 15),)
      ],
    ),
   )
          ],
        ),
      ),
    );
  }
}