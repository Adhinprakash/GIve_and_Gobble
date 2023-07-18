
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';

class Completedlistwidget extends StatelessWidget {
  const Completedlistwidget({super.key, required this.food, required this.people, required this.time, required this.location, required this.chat});
final String? food;
final String? people;
final String? time;
final String? location;
final IconData chat;
  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
    itemCount: 10,
    itemBuilder:(BuildContext  context, index) {
     return ListTile(
      onTap: () {
//            Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => POstDetails()),
// );
      },
      leading: Container(
        width: 90,
        height:90 ,
        decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage("assets/Paneer masala.jfif",),fit: BoxFit. fill),
            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.9),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4))
                            ]
        ),
        
        ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
        Text(food!,style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 17),),
           Text(people!,style: textStyleFuc(weight: FontWeight.w600, color: Colors.grey, size: 11) ,) ,
             Text(time!,style:  textStyleFuc(weight: FontWeight.w600, color:Colors.grey, size: 11),)  ,
              Text(location!,style:  textStyleFuc(weight: FontWeight.w300, color: Colors.grey, size: 11),  ),
             Container(
              width: 90,
              height: 18,
              child: Center(child: Text("Completed",style: textStyleFuc(weight: FontWeight.w300, color: kwhite, size: 12),)),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4)
              ),
             )
        ],
      ),
     );
     }, );
  }
}