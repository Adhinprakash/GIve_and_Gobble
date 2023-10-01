import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/api/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ResLogin extends ChangeNotifier {
  final emailOResnamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> restaurantlogin(context) async {
    final String emailorResname = emailOResnamecontroller.text;
    final String password = passwordcontroller.text;
    try {
      _setIsLoading(true); // Show the loader

      final response = await http.post(
        Uri.parse(Api.restaurantlogin),
        body: {'identifier': emailorResname, 'password': password},
      );
      _setIsLoading(false); // Show the loader

      if (response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isResLoggedIn', true);

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(
            'resRefresh', jsonDecode(response.body)['refreshToken']);

        sharedPreferences.setString(
            'resAccess', jsonDecode(response.body)['accessToken']);
    
  
        emailOResnamecontroller.clear();
        passwordcontroller.clear();

        notifyListeners();
        return true;
      } else {
        _setIsLoading(false); 

        notifyListeners();
        return false;
      }
    } catch (error) {
      _setIsLoading(false); 
      notifyListeners();
      return false;
    }
  }

  Future<bool> restaurantlogout(BuildContext context) async {
   
    try {
      _setIsLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('isResLoggedIn');
      prefs.remove('isResRegistered');
      prefs.remove('userId');
      prefs.remove('userRole');
      prefs.remove('resAccess');
      prefs.remove('refreshToken');
   SharedPreferences preferences=await SharedPreferences.getInstance();
   await preferences.remove("resAccess");
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     await  sharedPreferences.remove("resAccess");
      _setIsLoading(false);
      notifyListeners();
      return true;
    } catch (e) {
      notifyListeners();
      return false;
    }
    // Navigate to the login page after logout.
    // ignore: use_build_context_synchronously
  }
}
