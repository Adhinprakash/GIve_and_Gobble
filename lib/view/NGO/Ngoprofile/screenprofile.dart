import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/NGO/Ngoprofile/sceen_editprofile.dart';
import 'package:give_gobble/view/User/widgets/commonappbar.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [CommonAppbarwidget(title: "Profile", leading: Icons.arrow_back, color: kBlack, buttoncolor: kBlack),
    
       Padding(
         padding: const EdgeInsets.only(top: 35),
         child:           Stack(
                      children: [
                        SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.asset(
                              "assets/valunteer-removebg-preview (1).png",
                            )),
                        Positioned(
                            bottom: 9,
                            right: 30,
                            child: CircleAvatar(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenEditNgoProfile()),
                                  );
                                },
                                child: const SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Icon(Icons.edit)),
                              ),
                            ))
                      ],
                    )
       ),
       const Text("Angel Food"),
       kheight30,
    
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("NGO name:",style: textStyleFuc(weight:FontWeight.w700 , color: kBlack, size: 16)),
            const Text("Angel Foods"),

        ],
       ),
        const SizedBox(
        height: 50,
       ),
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Email:",style: textStyleFuc(weight:FontWeight.w700 , color: kBlack, size: 16),),
            const Text("adhinprakash70@gmail.com"),

        ],
       ),
       const SizedBox(
        height: 50,
       ),
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Phone number:",style: textStyleFuc(weight:FontWeight.w700 , color: kBlack, size: 16)),
            const Text("Angel Foods"),

        ],
       ),
         const SizedBox(
        height: 50,
       ),
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Address:",style: textStyleFuc(weight:FontWeight.w700 , color: kBlack, size: 16)),
            const Text("Angel Foods"),

        ],
       ),
       kheight30,
      
      TextButton(onPressed: (){}, child: Text("Logout",style: textStyleFuc(weight: FontWeight.w600, color: Colors.red, size: 20),))
    ],

  
    );
  }
}