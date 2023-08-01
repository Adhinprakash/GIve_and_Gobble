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
      print(resaturantname);
      print(email);

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

    try {
      _otpLoading(true);
      print(uId);
      print(otpcontroller);
      final response =
          await http.post(Uri.parse(Api.ressignUpsteptwo + uId), body: {
        "email": email,
        "username": username,
        "password": password,
        "location": location,
        "enteredOtp": otp
      });
      _otpLoading(false);
      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isResRegistered', true);

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(
            'resRefresh', jsonDecode(response.body)['refreshToken']);

        sharedPreferences.setString(
            'resAccess', jsonDecode(response.body)['accessToken']);

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
}
