import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/api/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NgoProvider extends ChangeNotifier {
  final ngonamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final locationcontroller = TextEditingController();
  final ngotypecontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final otpcontroller = TextEditingController();
  String uId = "";
  String errormsg = '';
  String otperror = '';
  String emaildetail = '';

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

  Future<bool> ngoregister() async {
    final String username = ngonamecontroller.text;
    final String email = emailcontroller.text;
    final String address = locationcontroller.text;
    final String password = passwordcontroller.text;
    final String ngotype = ngotypecontroller.text;
    final String pincode = pincodecontroller.text;
    try {
      _setIsLoading(true);
      final response = await http.post(Uri.parse(Api.ngosignUpstepone), body: {
        "email": email,
        "username": username,
        "password": password,
        "address": address,
        "ngoType": ngotype,
        "pincode": pincode
      });
      _setIsLoading(false);
      final Map<String, dynamic> data = json.decode(response.body);
      uId = data["uId"];
      log(response.body);
      // String errorMessage = data["message"] ?? "Unknown error occurred";
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

  Future<int> ngoregistertwo(context) async {
    final String username = ngotypecontroller.text;
    final String email = emailcontroller.text;
    final String address = locationcontroller.text;
    final String password = passwordcontroller.text;
    final String ngotype = ngotypecontroller.text;
    final String pincode = pincodecontroller.text;
    final String otp = otpcontroller.text;
    try {
      final response =
          await http.post(Uri.parse(Api.ngosignUpsteptwo + uId), body: {
        "email": email,
        "username": username,
        "password": password,
        "address": address,
        "ngoType": ngotype,
        "pincode": pincode,
        "enteredOtp": otp
      });
      final Map<String, dynamic> data = json.decode(response.body);

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      sharedPreferences.setString('ngoname', data['user']['username']);
      sharedPreferences.setString('email', data['user']['email']);
      sharedPreferences.setString('location', data['user']['address']);

      sharedPreferences.setString('role', data['user']['role']);
      sharedPreferences.setString('profile', data['user']['profile']);
      sharedPreferences.setString('ngotype', data['user']['ngoType']);
      sharedPreferences.setString(
          'ngoRefresh', jsonDecode(response.body)['refreshToken']);

      sharedPreferences.setString(
          'ngoAccess', jsonDecode(response.body)['accessToken']);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isNgoRegistered', true);
      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 400) {
        notifyListeners();
        return 400;
      } else {
        notifyListeners();
        return 201;
      }
    } catch (e) {
      notifyListeners();
      return 500;
    }
  }
}
