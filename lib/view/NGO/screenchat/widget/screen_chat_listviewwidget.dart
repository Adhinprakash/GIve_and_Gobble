
  import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:sizer/sizer.dart';

class NgoListwidget extends StatelessWidget {
    const NgoListwidget({
      super.key, this.username, this.email, this.profile, this.address,
 
    });
    final String? username;
    final String? email;
    final String? profile;
    final String? address;
    @override
    Widget build(BuildContext context) {
      
       return Container(
        decoration: BoxDecoration(borderRadius:const BorderRadius.only(
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
              onTap: ()  {
             
              },
              leading: Container(
                width: 12.w,
                height: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(profile!), fit: BoxFit.fill),
                 ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               
                  Text(
                    username!,
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: Colors.grey, size: 11),
                  ),
                Text(
                    email!,
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: Colors.grey, size: 11),
                  ),Text(
                    address!,
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: Colors.grey, size: 11),
                  ),
              
                ],
              ),
       
            ),
            
       );
      
    }
  }
