import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/api/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserLogin extends ChangeNotifier {
  final emailOrusernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  String role = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<int> userlogin(context) async {
    final String emailorusername = emailOrusernamecontroller.text;
    final String password = passwordcontroller.text;

    try {
      _setIsLoading(true);
      final response = await http.post(
        Uri.parse(Api.loginApi),
        body: {'identifier': emailorusername, 'password': password},
      );
       
      _setIsLoading(false); // Hide the loader
   Map<String,dynamic>responseData=jsonDecode(response.body);
      if (response.statusCode == 201) {
        // Login successful

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(
            'userRefresh', jsonDecode(response.body)['refreshToken']);

        sharedPreferences.setString(
            'userAccess', jsonDecode(response.body)['accessToken']);
            
             String userId = responseData['user']['_id'];
      sharedPreferences.setString('userId', userId);
        emailOrusernamecontroller.clear();
        passwordcontroller.clear();

        notifyListeners();
        return 201;
      } else {
        _setIsLoading(false);
        notifyListeners();
        return 401;
      }
    } catch (error) {
      _setIsLoading(false);

      notifyListeners();
      return 500;
    }
  }

  Future<bool> logout(BuildContext context) async {
    try {
      _setIsLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      prefs.remove('isRegistered');
      prefs.remove('isLoggedIn');
      prefs.remove('userId');
      prefs.remove('userRole');
      prefs.remove('refreshToken');

         SharedPreferences preferences = await SharedPreferences.getInstance();
         
         await preferences.remove("userAccess");
         String? access=preferences.getString("userAccess");
                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            await sharedPreferences.remove("userAccess");

      _setIsLoading(false);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
