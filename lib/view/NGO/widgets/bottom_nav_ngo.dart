import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/messageprovider/message_provider.dart';
import 'package:provider/provider.dart';

ValueNotifier<int> channgeindexnotifier = ValueNotifier(0);

class BottomNavigationWidgetNgo extends StatelessWidget {
  const BottomNavigationWidgetNgo({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: channgeindexnotifier,
      builder: (context, int newindex, _) {
        return BottomNavigationBar(
            currentIndex: newindex,
            elevation: 0,
            onTap: (newindex) {
              log('clicked');
              Provider.of<MessageProvider>(context,listen: false).getMessages();
              channgeindexnotifier.value = newindex;


            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kpink,
            unselectedItemColor: Colors.grey,
            backgroundColor: kwhite,
            selectedIconTheme: IconThemeData(color: kpink),
            unselectedIconTheme:
                const IconThemeData(color: Color.fromARGB(255, 16, 1, 1)),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                  ),
                  label: "Message"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done_all_sharp), label: 'Completed'),
 
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: 'Profile'),
            ]);
      },
    );
  }
}
