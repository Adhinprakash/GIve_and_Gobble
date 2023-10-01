import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/login/screen_res_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<int> indexchangingnotifier = ValueNotifier(0);

class ResBottomNavigationWidget extends StatelessWidget {
  const ResBottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexchangingnotifier,
      builder: (context, int newindex, _) {
        return BottomNavigationBar(
            currentIndex: newindex,
            elevation: 0,
            onTap: (newindex)async {
              SharedPreferences sharedPreferences= await SharedPreferences.getInstance();

              String? myvalue=sharedPreferences.getString("resAccess");

              if(myvalue==null){
resshowLoginRequiredDialog(context);
              }else{
              indexchangingnotifier.value = newindex;

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
                    Icons.add_box_outlined,
                  ),
                  label: 'Donation'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: 'History'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: 'Profile'),
            ]);
      },
    );
  }
    void resshowLoginRequiredDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Login Required'),
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
                                          builder: (context) => ScreenRestaurantLogin(),
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
