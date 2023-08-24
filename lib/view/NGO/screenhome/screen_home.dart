import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/foodrequests/foodrequest.dart';
import 'package:give_gobble/controller/provider/ngo_login.dart';
import 'package:give_gobble/view/NGO/screencompleted/screen_completed.dart';
import 'package:give_gobble/view/NGO/screenhome/widgets/card_widget.dart';
import 'package:give_gobble/view/NGO/screenhome/widgets/foodrequest_list.dart';
import 'package:give_gobble/view/NGO/screenpending/screen_pending.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScreenHomeNgo extends StatefulWidget {
  const ScreenHomeNgo({super.key});

  @override
  State<ScreenHomeNgo> createState() => _ScreenHomeNgoState();
}

class _ScreenHomeNgoState extends State<ScreenHomeNgo> {

  @override
  void initState() {
    Provider.of<UserFoodrequests>(context, listen: false).getrequests();
    Provider.of<UserFoodrequests>(context, listen: false).getaccepted();
    Provider.of<UserFoodrequests>(context, listen: false).getcompleted();
          Provider.of<UserFoodrequests>(context,listen: false).getAllngos();

    Provider.of<NgoLogin>(context, listen: false)
        .getNgoDetailsFromSharedPreferences();

        //  Provider.of<UserFoodrequests>(context).pendingRequest.length;
        //           Provider.of<UserFoodrequests>(context).acceptedrequest.length.toString();
        //  Provider.of<UserFoodrequests>(context).completedreqlist.length.toString();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Consumer<UserFoodrequests>(
      builder: (context, value, child) {
        return Column(
          children: [
            Container(
              width: 500,
              height: 400,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(4, 4),
                        blurRadius: 19,
                        spreadRadius: 1)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [kpink, kwhite])),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Give&Gobble",
                      style:
                          GoogleFonts.reenieBeanie(color: kwhite, fontSize: 45),
                    ),
                    kheight30,
                    kheight30,
                    Text(
                      "Request Status",
                      style: textStyleFuc(
                          weight: FontWeight.w400,
                          color: Colors.white,
                          size: 17),
                    ),
                    kheight30,
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                //   Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const ScreenPending()),
                                // );
                              },
                              child: CardWidgetNgo(
                                  count: value.pendingRequest.length.toString(),
                                  text: "pending")),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ScreenAccept()),
                              );
                            },
                            child: SizedBox(
                              child: CardWidgetNgo(
                                count: value.acceptedrequest.length.toString(),
                                text: "Accept",
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ScreenCompleted()),
                              );
                            },
                            child: SizedBox(
                              child: CardWidgetNgo(
                                count: value.completedreqlist.length.toString(),
                                text: "Completed",
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "New Request",
                      style: textStyleFuc(
                          weight: FontWeight.w700, color: kBlack, size: 18),
                    ),
                  ),
                if(value.pendingRequest.isNotEmpty)
                  Expanded(
                    
                    child: ListView.builder(
                      
                        itemCount: 10,
                        itemBuilder: (context, index) {
                               int reversedIndex = value.pendingRequest.length - 1 - index;
                          return RequestListWidget(
                            image: value.pendingRequest[reversedIndex]['image'],
                            id: value.pendingRequest[reversedIndex]['_id'],
                            foods: value.pendingRequest[reversedIndex]['title'],
                            people:
                                "food for ${value.pendingRequest[reversedIndex]['quantity'].toString()} people",
                            time:
                                "cooking time:  ${value.pendingRequest[reversedIndex]['time']}",
                            location: value.pendingRequest[reversedIndex]['location'],
                          );
                        }),
                  ),
                  if(value.pendingRequest.isEmpty)
                  const Center(child:  CircularProgressIndicator(),)
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
