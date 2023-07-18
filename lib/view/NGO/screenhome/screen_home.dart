import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/NGO/screencompleted/screen_completed.dart';
import 'package:give_gobble/view/NGO/screenhome/widgets/card_widget.dart';
import 'package:give_gobble/view/NGO/screenhome/widgets/foodrequest_list.dart';
import 'package:give_gobble/view/NGO/screenpending/screen_pending.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenHomeNgo extends StatelessWidget {
  const ScreenHomeNgo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  style: GoogleFonts.reenieBeanie(color: kwhite, fontSize: 45),
                ),
                kheight30,
                kheight30,
                Text(
                  "Request Status",
                  style: textStyleFuc(
                      weight: FontWeight.w400, color: Colors.white, size: 17),
                ),
                kheight30,
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CardWidgetNgo(count: "2", text: "New"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScreenPending()),
                          );
                        },
                        child: SizedBox(
                          child: CardWidgetNgo(
                            count: "0",
                            text: "Pending",
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScreenCompleted()),
                          );
                        },
                        child: SizedBox(
                          child: CardWidgetNgo(
                            count: "14",
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
         Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Text("New Request",style: textStyleFuc(weight: FontWeight.w700, color: kBlack,size: 18),),
            ),
            const RequestListWidget(
              food: "Paneer Masala",
              people: "food for 30 people",
              time: "cooking time: 10:44 PM",
              location: "Kakkanjery,kerala,43473",
            )
          ],
        )
      ],
    );
  }
}
