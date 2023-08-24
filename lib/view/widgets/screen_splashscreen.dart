import 'package:flutter/material.dart';
import 'package:give_gobble/view/NGO/screenmain.dart';
import 'package:give_gobble/view/Restaurant/screen_main.dart';
import 'package:give_gobble/view/User/screenmain.dart';
import 'package:give_gobble/view/landingpages/landing_pages.dart';
import 'package:give_gobble/view/walkthroughpages/walkthrough.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? check = false;

  @override
  void initState() {
    super.initState();
    isCheck();
    _initializeApp();
  }

  void isCheck() async {
    SharedPreferences iswalkthroughpages =
        await SharedPreferences.getInstance();
    check = iswalkthroughpages.getBool('iswalkthroughpages');
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 2)); // Show splash screen for 2 seconds

    final statusMap = await _checkStatus();
    navigateToNextScreen(statusMap);
  }

  Future<Map<String, bool>> _checkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    bool isResLoggedIn = prefs.getBool('isResLoggedIn') ?? false;
    bool isRegistered = prefs.getBool('isRegistered') ?? false;
    bool isResRegistered = prefs.getBool('isResRegistered') ?? false;
    bool isNgoRegistered = prefs.getBool('isNgoRegistered') ?? false;
    bool isNgoLoggedIn = prefs.getBool('isNgoLoggedIn') ?? false;

    return {
      'isLoggedIn': isLoggedIn,
      'isResLoggedIn': isResLoggedIn,
      'isRegistered': isRegistered,
      'isResRegistered': isResRegistered,
      'isNgoRegistered': isNgoRegistered,
      'isNgoLoggedIn': isNgoLoggedIn,
    };
  }

  void navigateToNextScreen(Map<String, bool> statusMap) {
    
      if (check != true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WalkThroughPages()),
        );
      } else if (statusMap['isLoggedIn'] == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ScreenMainPage()),
        );
      } else if (statusMap['isResLoggedIn'] == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ScreenResMainPage()),
        );
      } else if (statusMap['isRegistered'] == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ScreenMainPage()),
        );
      } else if (statusMap['isResRegistered'] == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ScreenResMainPage()),
        );
      } else if (statusMap['isNgoRegistered'] == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ScreenNgoMainpage()),
        );
      } else if (statusMap['isNgoLoggedIn'] == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ScreenNgoMainpage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LandingPages()),
        );
      }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(
          color: Colors.pink, // Pink background color
        ),
        child: Center(
          child: Text(
            "Give and Gobble",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
