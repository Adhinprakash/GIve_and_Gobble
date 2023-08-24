import 'package:flutter/material.dart';
import 'package:give_gobble/controller/provider/foodrequests/foodrequest.dart';
import 'package:give_gobble/controller/provider/forgot_password.dart';
import 'package:give_gobble/controller/provider/messageprovider/message_provider.dart';
import 'package:give_gobble/controller/provider/news_request/news_request.dart';
import 'package:give_gobble/controller/provider/ngo_forgot_password.dart';
import 'package:give_gobble/controller/provider/ngo_login.dart';
import 'package:give_gobble/controller/provider/ngo_signup.dart';
import 'package:give_gobble/controller/provider/res_forgot_password.dart';
import 'package:give_gobble/controller/provider/restarant_signup.dart';
import 'package:give_gobble/controller/provider/restaurant_login.dart';
import 'package:give_gobble/controller/provider/user_login.dart';
import 'package:give_gobble/controller/provider/user_signup.dart';
import 'package:give_gobble/view/widgets/screen_splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserLogin(),
          ),
          ChangeNotifierProvider(
            create: (context) => RestaurantProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ResLogin(),
          ),
          ChangeNotifierProvider(
            create: (context) => NgoProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => NgoLogin(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserFoodrequests(),
          ),
          ChangeNotifierProvider(
            create: (context) => NewsApi(),
          ),
          ChangeNotifierProvider(
            create: (context) => Forgotpassword(),
          ),
          ChangeNotifierProvider(
            create: (context) => ResForgotpassword(),
          ),
          ChangeNotifierProvider(
            create: (context) => NgoForgotpassword(),
          ),
          ChangeNotifierProvider(create: (context) => MessageProvider(),)
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const SplashScreen(),
            );
          },
        ));
  }
}
