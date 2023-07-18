import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/Restaurant/widgets/donation_appbara_widget.dart';
import 'package:give_gobble/view/Restaurant/widgets/textformfield_widget.dart';

class ScreenRestaurantDonation extends StatefulWidget {
  const ScreenRestaurantDonation({super.key});

  @override
  State<ScreenRestaurantDonation> createState() => _ScreenRestaurantDonationState();
}

class _ScreenRestaurantDonationState extends State<ScreenRestaurantDonation> {
  double currentvalue=0;
bool value=false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
       const RestaurantAppbarWidet(title: 'Create New Post', leading:Icons.arrow_back, trailing: "Post"),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight30,
              Row(children: [
                 Image.asset("assets/reastaurant final.png",width: 80,height: 80,),
                 kwidth15,
                Text(
                  "14's Restaurant",
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: kBlack, size: 15),
                )
              ]),
              kheight30,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:ResTextFormfieldWidget(labelText: "Enter Food details"),
              ),
              kHeight15,
              Padding(
                padding:  const EdgeInsets.all(10),
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
              kheight30,
              Text("cooking time",style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 18),),
              kheight30,
            Row(
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
              Center(
                child: Text("Address",style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 20),),
        
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
                child: ResTextFormfieldWidget(labelText: "Enter your food pickup address"),
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
