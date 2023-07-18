
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/User/widgets/commonappbar.dart';

class ScreenPendingCompleted extends StatelessWidget {
  const ScreenPendingCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: ListView(
          children: [Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CommonAppbarwidget(title: "Post details", leading: Icons.arrow_back, color: kBlack, buttoncolor: kBlack),
            Container(
              width: 800,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/Paneer masala.jfif"),fit:BoxFit.fill )
              ),
              ),
           
        
           Container(
            width: 800,
            height: 450,
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
                      "Adhin prakash",
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
                   Padding(
                     padding: const EdgeInsets.only(left: 50,top: 10),
                     child: Text("open Location in map",style: textStyleFuc(weight: FontWeight.w400, color: kpink, size: 15),),
                   ),

              ],
            ),
          )
              ],
            ),
           ),
           kHeight15,
     Center(
       child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            FocusScopeNode currentFocus = FocusScope.of(context);
          
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
          
                        
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                          child: Text(
                            "Completed",
                            style: textStyleFuc(
                                weight: FontWeight.w500,
                                color: Colors.white,
                                size: 22),
                          ),
                        )),
     ),
            
            ],
          ),
          ]
        ),
      ),
    );
  }
}