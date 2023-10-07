import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/messageprovider/message_provider.dart';
import 'package:give_gobble/view/login/screen_ngo_login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            onTap: (newindex)async {
                SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
            String? value=sharedPreferences.getString("ngoAccess");
            if(value==null){
              showLoginRequiredDialog(context);
            }else{
log('clicked');
              Provider.of<MessageProvider>(context,listen: false).getMessages();
              channgeindexnotifier.value = newindex;
            }
            


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
   void showLoginRequiredDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Login Required'),
        content: const Text('Please log in to continue.'),
        actions: <Widget>[
          Row(
            children: [
               TextButton(
                child: Text('Login'),
                onPressed: () {
                 Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ScreenNgoLogin(),
                                        ),
                                        (route) => false,
                                      ); // Close the dialog
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
}
