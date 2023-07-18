
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/Restaurant/screen_main.dart';

class RestaurantAppbarWidet extends StatelessWidget {
  const RestaurantAppbarWidet({super.key, required this.title,  required this.leading, required this.trailing});
final String title;
final IconData leading;
final String trailing;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kwhite,
      shadowColor: Colors.grey,
      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListTile( 
        
        
        leading: IconButton(onPressed: (){
            Navigator.push(
  context,
  MaterialPageRoute(builder: (context) =>  ScreenResMainPage() ),
);
        }, icon: Icon(leading),color: Colors.black,),
        title: Center(child: Text(title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
    
        trailing: TextButton(onPressed: (){}, child: Text(trailing,style: textStyleFuc(weight: FontWeight.w400, color: kpink, size: 16),)) ,
      
      ),
    );
  }
}