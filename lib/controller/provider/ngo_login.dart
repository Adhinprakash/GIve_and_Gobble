import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/api/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NgoLogin extends ChangeNotifier {
  final emailOResnamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  List ngodetails = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<int> ngologin(context) async {
    final String emailorResname = emailOResnamecontroller.text;
    final String password = passwordcontroller.text;
    try {
      _setIsLoading(true); // Show the loader

      final response = await http.post(
        Uri.parse(Api.ngologin),
        body: {'identifier': emailorResname, 'password': password},
      );
      final Map<String, dynamic> data = json.decode(response.body);

      log(response.statusCode.toString());
      log(response.body);

      _setIsLoading(false); // Show the loader
// print(response.body);
      if (response.statusCode == 401) {
        emailOResnamecontroller.clear();
        passwordcontroller.clear();

        notifyListeners();
        return 401;
      } else if (response.statusCode == 403) {
        notifyListeners();
        return 403;
      } else {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isNgoLoggedIn', true);
        sharedPreferences.setString('ngoname', data['user']['username']);
        sharedPreferences.setString('email', data['user']['email']);
        sharedPreferences.setString('location', data['user']['address']);
        sharedPreferences.setString('id', data['user']['_id']);

        sharedPreferences.setString('role', data['user']['role']);
        sharedPreferences.setString('profile', data['user']['profile']);
        sharedPreferences.setString('ngotype', data['user']['ngoType']);
        sharedPreferences.setString(
            'ngoRefresh', jsonDecode(response.body)['refreshToken']);
        
        sharedPreferences.setString(
            'ngoAccess', jsonDecode(response.body)['accessToken']);
        String ngoaccess = sharedPreferences.getString('ngoAccess')!;
        notifyListeners();
        return 201;
      }
    } catch (error) {
      notifyListeners();
      return 500;
    }
  }

  Future<bool> ngologout(BuildContext context) async {
    try {
      _setIsLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('isNgoRegistered');
      prefs.remove('isNgoLoggedIn');
      prefs.remove('userId');
      prefs.remove('userRole');
      prefs.remove('refreshToken');
      prefs.remove('role');
      prefs.remove('profile');
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      await sharedPreferences.remove("ngoAccess");
        SharedPreferences ngopreference=await SharedPreferences.getInstance();
        await ngopreference.remove("ngoAccess");

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

  Future<void> getNgoDetailsFromSharedPreferences() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String username = pref.getString('ngoname') ?? '';
      String email = pref.getString('email') ?? '';
      String location = pref.getString('location') ?? '';
      String role = pref.getString('role') ?? '';
      String image = pref.getString('profile') ?? '';
      String ngotype = pref.getString('ngotype') ?? '';
      String id = pref.getString('id') ?? '';

      ngodetails = [
        {'key': 'ngoname', 'value': username},
        {'key': 'email', 'value': email},
        {'key': 'location', 'value': location},
        {'key': 'role', 'value': role},
        {'key': 'profile', 'value': image},
        {'key': 'ngotype', 'value': ngotype},
       {'key': '_id', 'value': id},

      ];
      notifyListeners();
    } catch (e) {
    return  log("Error retrieving user details from SharedPreferences: $e");
    }
  }
}
