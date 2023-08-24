import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/api/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantProvider extends ChangeNotifier {
  final resnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final locationcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpassword = TextEditingController();
  final otpcontroller = TextEditingController();
  String uId = "";
  String errormsg = '';
  String otperror = '';
  bool isBack = false;
  List restaurantdetails = [];
  bool _isLoading = false;

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

  Future<bool> resregister(context) async {
    final String resaturantname = resnamecontroller.text;
    final String email = emailcontroller.text;
    final String location = locationcontroller.text;
    final String password = passwordcontroller.text;

    try {
      _setIsLoading(true);
  

      final response = await http.post(Uri.parse(Api.ressignUpstepone), body: {
        "email": email,
        "username": resaturantname,
        "password": password,
        "location": location,
      });
      _setIsLoading(false);
      log(response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      uId = data["uId"];
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

  Future<bool> resregistertwo(otp) async {
    final String username = resnamecontroller.text;
    final String email = emailcontroller.text;
    final String location = locationcontroller.text;
    final String password = passwordcontroller.text;
    final String otp = otpcontroller.text;
    try {
      _otpLoading(true);
      final response =
          await http.post(Uri.parse(Api.ressignUpsteptwo + uId), body: {
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

      SharedPreferences pref = await SharedPreferences.getInstance();
      if (response.statusCode == 201) {
        pref.setString('restaurant', data['restaurant']['username']);
        pref.setString('email', data['restaurant']['email']);
        pref.setString('location', data['restaurant']['location']);
        pref.setString('role', data['restaurant']['role']);
        pref.setString('resprofile', data['restaurant']['profile']);
        pref.setString('resRefresh', jsonDecode(response.body)['refreshToken']);

        pref.setString('resAccess', jsonDecode(response.body)['accessToken']);
                String resId = data['restaurant']['_id'];
      pref.setString('resId', resId);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isResRegistered', true);

        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> getRestaurantDetailsFromSharedPreferences() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String username = pref.getString('restaurant') ?? '';
      String email = pref.getString('email') ?? '';
      String location = pref.getString('location') ?? '';
      String role = pref.getString('role') ?? '';
      String image = pref.getString('resprofile') ?? '';

      restaurantdetails = [
        {'key': 'restaurant', 'value': username},
        {'key': 'email', 'value': email},
        {'key': 'location', 'value': location},
        {'key': 'role', 'value': role},
        {'key': 'resprofile', 'value': image},
      ];
      notifyListeners();
    } catch (e) {
      log("Error retrieving user details from SharedPreferences: $e");
    }
  }
}
