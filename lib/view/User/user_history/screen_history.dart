import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/foodrequests/foodrequest.dart';
import 'package:give_gobble/view/User/widgets/commonappbar.dart';
import 'package:give_gobble/view/User/widgets/listviewbuilder_widget.dart';
import 'package:provider/provider.dart';

class ScreenHistory extends StatefulWidget {
  const ScreenHistory({super.key});

  @override
  State<ScreenHistory> createState() => _ScreenHistoryState();
}

class _ScreenHistoryState extends State<ScreenHistory> {
  @override
  void initState() {
      Provider.of<UserFoodrequests>(context,listen: false).userdonationdeatails();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Consumer<UserFoodrequests>(
      builder: (context, value, child) {
        return  Column(
        children: [
          CommonAppbarwidget(
              title: "History",
              leading: Icons.arrow_back,
              color: Colors.black,
              buttoncolor: kBlack),
           Expanded(
              child: ListView.builder(
                itemCount: value.userreqdetais.length,
                itemBuilder:(context, index) {
                   if (index == value.userreqdetais.length+1) {
        // Show the circular progress indicator while loading
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

                       int reversedIndex = value.userreqdetais.length - 1 - index;

                        return ListViewBuilderWidget(
                          id: value.userreqdetais[reversedIndex]['_id'],
                          image: value.userreqdetais[reversedIndex]['image'],
                          food: value.userreqdetais[reversedIndex]['title'],
                          people: "Food for ${value.userreqdetais[reversedIndex]['quantity']}",
                          time: "cooking time: ${value.userreqdetais[reversedIndex]['time']}",
                          location: value.userreqdetais[reversedIndex]['location'],
                        );
                }, 
          
              ))
        ],
      );
      },
      
    );
  }
}
