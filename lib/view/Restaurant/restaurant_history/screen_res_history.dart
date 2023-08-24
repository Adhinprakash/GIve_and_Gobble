import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/foodrequests/foodrequest.dart';
import 'package:give_gobble/view/Restaurant/widgets/common_appbarwidget.dart';
import 'package:give_gobble/view/Restaurant/widgets/list_widget.dart';
import 'package:provider/provider.dart';

class ScreenResHistory extends StatefulWidget {
  const ScreenResHistory({super.key});

  @override
  State<ScreenResHistory> createState() => _ScreenResHistoryState();
  
}

class _ScreenResHistoryState extends State<ScreenResHistory> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserFoodrequests>(context,listen: false).resdonationdeatails();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<UserFoodrequests>(
      builder: (context, value, child) {
        return Column(
        children: [
          RestCommonAppbarwidget(
              title: "History",
              leading: Icons.arrow_back,
              color: Colors.black,
              buttoncolor: kBlack),
           Expanded(
              child: ListView.builder(
                itemCount: value.restaurantdetails.length,
                itemBuilder: (context, index) {
                                         int reversedIndex = value.restaurantdetails.length - 1 - index;

                  return  ListWidget
                  (
                    id: value.restaurantdetails[reversedIndex]['_id'],
                    image: value.restaurantdetails[reversedIndex]['image'],
                        food: value.restaurantdetails[reversedIndex]['title'],
                        people: "food for ${value.restaurantdetails[reversedIndex]['quantity']} people",
                        time: "cooking time: ${value.restaurantdetails[reversedIndex]['time']}",
                        location: value.restaurantdetails[reversedIndex]['location'],
                      );
                },
                
              ))
        ],
      );
      },
      
    );
  }
}
