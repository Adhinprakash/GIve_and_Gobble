import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/User/appbar__widget.dart';
import 'package:give_gobble/view/User/widgets/textformfield_widget.dart';

class ScreenDonation extends StatefulWidget {
  const ScreenDonation({super.key});

  @override
  State<ScreenDonation> createState() => _ScreenDonationState();
}

class _ScreenDonationState extends State<ScreenDonation> {
  double currentvalue=0;
bool value=false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
       const DonationPageAppbar(title: 'Create New Post', leading:Icons.arrow_back, trailing: "Post"),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight30,
              Row(children: [
                 Image.asset("assets/valunteer-removebg-preview (1).png",width: 80,height: 80,),
                 kwidth15,
                Text(
                  "Adhin prakash",
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: kBlack, size: 15),
                )
              ]),
              kheight30,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:TextFormfieldWidget(labelText: "Enter Food details"),
              ),
              kHeight15,
              Padding(
                padding:  const EdgeInsets.only(left:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                  ,
                  children: [
                    Text("Food Quantity",style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 18),),
                    Text("${currentvalue.round()} person")
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 420,
                  child: Slider(
                    activeColor: kpurple,
                    min: 0,
                    max: 200,
                  divisions: 200,
                    value: currentvalue, onChanged: (value){
                      
                    setState(() {
                      currentvalue=value;
                    });
                  }),
                ),
              ),
              kHeight15,
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text("cooking time",style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 18),),
              ),
              kHeight15,
              
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Row(
                      children: [
                       Icon(Icons.alarm),
                       kwidth15,
                        Text("6:59 PM")
                      ],
                    ),
                    TextButton(onPressed: (){}, child: Text("Select",style: textStyleFuc(weight: FontWeight.w500, color: kpink, size: 15),))
                  ],
                ),
            ),
            kHeight15,
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text("Address",style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 18),),
              ),
              Row(
                children: [
              Checkbox(value: value, onChanged: (value){}),
              kwidth15,
             Text("Use my current location",style: textStyleFuc(weight: FontWeight.w200, color: kBlack38, size: 14),),
             
                ],
              ),
              kHeight15,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text("Pick up address",style: textStyleFuc(weight: FontWeight.w400, color: kBlack, size: 18),),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormfieldWidget(labelText: "Enter your food pickup address"),
              ),
              kheight30,
              Center(child: SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: kpurple), child: Text("Post",style: textStyleFuc(weight: FontWeight.w500, color: Colors.white, size: 22),),)))
            ],
          ),
        )
      ],
    );
  }
}
