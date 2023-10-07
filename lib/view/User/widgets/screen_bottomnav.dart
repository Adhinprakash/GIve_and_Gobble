import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/login/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
ValueNotifier<int> indexchangenotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexchangenotifier,
      builder: (context, int newindex, _) {
        return BottomNavigationBar(
            currentIndex: newindex,
            elevation: 0,
            onTap: (newindex)async {

               SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String? myValue = sharedPreferences.getString('userAccess');
        if(myValue==null){
        showLoginRequiredDialog(context);
        }
        else{
  indexchangenotifier.value = newindex;
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
  void showLoginRequiredDialog(BuildContext context) {
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
                                          builder: (context) => ScreenLogin(),
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
