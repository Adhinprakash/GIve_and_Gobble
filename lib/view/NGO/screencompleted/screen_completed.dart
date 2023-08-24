import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/foodrequests/foodrequest.dart';
import 'package:give_gobble/view/NGO/screencompleted/widgets/completed_listwidget.dart';
import 'package:give_gobble/view/User/widgets/commonappbar.dart';
import 'package:provider/provider.dart';

class ScreenCompleted extends StatelessWidget {
  const ScreenCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<UserFoodrequests>(context, listen: false).getcompleted();
    return SafeArea(
      child: Scaffold(
        body: Consumer<UserFoodrequests>(
          builder: (context, completednotifier, child) {
            return Column(
              children: [
                CommonAppbarwidget(
                    title: "Completed",
                    leading: Icons.arrow_back,
                    color: Colors.black,
                    buttoncolor: kBlack),
                Expanded(
                  child: ListView.builder(
                    itemCount: completednotifier.completedreqlist.length,
                    itemBuilder: (context, index) {
                      return Completedlistwidget(
                        // image: completednotifier.completedreqlist[index]['image'],

                        food: completednotifier.completedreqlist[index]
                            ['title'],
                        people:
                            "food for ${completednotifier.completedreqlist[index]['quantity']} people",
                        time:
                            "cooking time: ${completednotifier.completedreqlist[index]['time']}",
                        location: completednotifier.completedreqlist[index]
                            ['location'],
                        chat: Icons.message_sharp,
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
