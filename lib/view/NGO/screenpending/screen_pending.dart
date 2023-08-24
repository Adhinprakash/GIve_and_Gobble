import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/foodrequests/foodrequest.dart';
import 'package:give_gobble/view/NGO/screenpending/widgets/pendinglists.dart';
import 'package:provider/provider.dart';

import '../../User/widgets/commonappbar.dart';

class ScreenAccept extends StatelessWidget {
  const ScreenAccept({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<UserFoodrequests>(context, listen: false).getaccepted();

    return SafeArea(
      child: Scaffold(
        body: Consumer<UserFoodrequests>(
          builder: (context, getacceptnotifier, child) {
            return Column(
              children: [
                CommonAppbarwidget(
                    title: "Accepted",
                    leading: Icons.arrow_back,
                    color: Colors.black,
                    buttoncolor: kBlack),
                Expanded(
                  child: ListView.builder(
                    itemCount: getacceptnotifier.acceptedrequest.length,
                    itemBuilder: (context, index) {
                              int reversedIndex = getacceptnotifier.acceptedrequest.length - 1 - index;

                      return PendingListWidget(
                        id: getacceptnotifier.acceptedrequest[reversedIndex]['_id'],
                        food: getacceptnotifier.acceptedrequest[reversedIndex]['title'],
                        people:
                            "food for ${getacceptnotifier.acceptedrequest[reversedIndex]['quantity']} people",
                        time:
                            "cooking time:  ${getacceptnotifier.acceptedrequest[reversedIndex]['time']}",
                        location: getacceptnotifier.acceptedrequest[reversedIndex]
                            ['location'],
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
