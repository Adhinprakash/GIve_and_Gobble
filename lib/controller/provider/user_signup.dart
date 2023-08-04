import 'dart:convert';
import 'dart:developer';
import 'package:give_gobble/controller/api/api_url.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final locationcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpassword = TextEditingController();
  final otpcontroller = TextEditingController();
  String uId = "";
  String errormsg = '';
  String otperror = '';
  String emaildetail = '';
  bool isBack = false;
  bool _isLoading = false;
  List userdetils = [];
  bool get isLoading => _isLoading;

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isotpLoading = false;

  bool get isotpLoading => _isotpLoading;

  void _otpLoading(bool value) {
    _isotpLoading = value;
    notifyListeners();
  }

  Future<bool> register(context) async {
    final String username = namecontroller.text;
    final String email = emailcontroller.text;
    final String location = locationcontroller.text;
    final String password = passwordcontroller.text;

    try {
      _setIsLoading(true);
      final response = await http.post(Uri.parse(Api.signupstepone), body: {
        "email": email,
        "username": username,
        "password": password,
        "location": location,
      });
      _setIsLoading(false);
      final Map<String, dynamic> data = json.decode(response.body);
      uId = data["uId"];
      log(response.body);
      if (response.statusCode == 200) {
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } catch (e) {
      notifyListeners();
      return false;
    }
  }

  Future<bool> registertwo(context) async {
    final String username = namecontroller.text;
    final String email = emailcontroller.text;
    final String location = locationcontroller.text;
    final String password = passwordcontroller.text;
    final String otp = otpcontroller.text;
    try {
      _otpLoading(true);
      print(uId);
      print(otpcontroller);
      final response =
          await http.post(Uri.parse(Api.signupsteptwo + uId), body: {
        "email": email,
        "username": username,
        "password": password,
        "location": location,
        "enteredOtp": otp
      });
      final Map<String, dynamic> data = json.decode(response.body);

      _otpLoading(false);
      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 201) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        sharedPreferences.setString('username', data['user']['username']);
        sharedPreferences.setString('email', data['user']['email']);
        sharedPreferences.setString('location', data['user']['location']);
        sharedPreferences.setString('role', data['user']['role']);
        sharedPreferences.setString('profile', data['user']['profile']);

        sharedPreferences.setString(
            'userRefresh', jsonDecode(response.body)['refreshToken']);

        sharedPreferences.setString(
            'userAccess', jsonDecode(response.body)['accessToken']);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isRegistered', true);

        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } catch (e) {
      notifyListeners();
      return false;
    }
  }

  Future<void> getUserDetailsFromSharedPreferences() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String username = sharedPreferences.getString('username') ?? '';
      String email = sharedPreferences.getString('email') ?? '';
      String location = sharedPreferences.getString('location') ?? '';
      String role = sharedPreferences.getString('role') ?? '';
      String image = sharedPreferences.getString('profile') ?? '';

      userdetils = [
        {'key': 'username', 'value': username},
        {'key': 'email', 'value': email},
        {'key': 'location', 'value': location},
        {'key': 'role', 'value': role},
        {'key': 'profile', 'value': image},
      ];
      notifyListeners();
    } catch (e) {
      print("Error retrieving user details from SharedPreferences: $e");
    }
  }
}
