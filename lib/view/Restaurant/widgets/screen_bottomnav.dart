

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';

ValueNotifier<int> indexchangingnotifier=ValueNotifier(0);
class ResBottomNavigationWidget extends StatelessWidget {
  const ResBottomNavigationWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexchangingnotifier, builder: (context, int newindex, _) {
          return BottomNavigationBar(
            currentIndex: newindex,
            elevation: 0,
            onTap: (newindex) {
              indexchangingnotifier.value=newindex;
            },
             type: BottomNavigationBarType.fixed,
            selectedItemColor: kpink,
            unselectedItemColor: Colors.grey,
            backgroundColor:kwhite,
            selectedIconTheme:  IconThemeData(color: kpink),
            unselectedIconTheme: const IconThemeData(color: Color.fromARGB(255, 16, 1, 1)),
            items: const [
                   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_outlined,), label: 'Donation'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: 'History' ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: 'Profile'),
              
          ]);
        },);
  }
}
