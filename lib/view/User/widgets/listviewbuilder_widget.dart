import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/User/user_history/postdetails/screen_postdetails.dart';
import 'package:sizer/sizer.dart';

class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget(
      {super.key,
      required this.food,
      required this.people,
      required this.time,
      required this.location,
       this.image, this.id});
  final String? image;
  final String? food;
  final String? people;
  final String? time;
  final String? location;
  final String? id;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:  BoxDecoration(borderRadius:const BorderRadius.only(
        topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
      ) ,color: const Color.fromARGB(255, 245, 245, 245),boxShadow:  [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],),
        child: ListTile(  
        
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  POstDetails(image: image,loction: location,quantity:people,time: time,title:food,)),
                );
              },
              leading: Container(
                width: 16.w,
                height: 13.h,
                decoration: BoxDecoration(
      
                    image:  DecorationImage(
                        image: NetworkImage(image!,),
                        fit: BoxFit.fill),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: const Offset(0, 4))
                    ]),
              ),
              title: SizedBox(
                height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food!,
                      style: textStyleFuc(
                          weight: FontWeight.w600, color: kBlack, size: 15),
                    ),
                    Text(
                      people.toString(),
                      style: textStyleFuc(
                          weight: FontWeight.w600, color: Colors.grey, size: 11),
                    ),
                    Text(
                      time!,
                      style: textStyleFuc(
                          weight: FontWeight.w600, color: Colors.grey, size: 11),
                    ),
                    Text(
                      location!,
                      style: textStyleFuc(
                          weight: FontWeight.w600, color: Colors.grey, size: 11,),maxLines: 1,
                    )
                  ],
                ),
              ),
            
                  
            ),
      ),
    );
  }
      
}
