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
// List ngoDetails=[];
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
      final response = await http.post(Uri.parse(Api.ngosignUpstepone), body: {
        "email": email,
        "username": username,
        "password": password,
        "address": address,
        "ngoType": ngotype,
        "pincode": pincode
      });
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

  Future<int> ngoregistertwo() async {
    final String username = ngotypecontroller.text;
    final String email = emailcontroller.text;
    final String address = locationcontroller.text;
    final String password = passwordcontroller.text;
    final String ngotype = ngotypecontroller.text;
    final String pincode = pincodecontroller.text;
    final String otp = otpcontroller.text;
    try {
      final response =
          await http.post(Uri.parse(Api.ngosignUpsteptwo+uId), body: {
        "email": email,
        "username": username,
        "password": password,
        "address": address,
        "ngoType": ngotype,
        "pincode": pincode,
        "enteredOtp": otp
      });

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 201) {
          SharedPreferences ngopreference=  await SharedPreferences.getInstance();
      ngopreference.setString("ngoAccess", jsonDecode(response.body)["accesstoken"]);
        notifyListeners();
        return 201;
      } else {
        notifyListeners();
        return 400;
      }
    } catch (e) {
      notifyListeners();
      return 500;
    }
  }

  //   Future<void> getNgoDetailsFromSharedPreferences() async {
  //   try {
  //     SharedPreferences sharedPreferences =
  //         await SharedPreferences.getInstance();
  //     String username = sharedPreferences.getString('ngoname') ?? '';
  //     String email = sharedPreferences.getString('email') ?? '';
  //     String location = sharedPreferences.getString('location') ?? '';
  //     String role = sharedPreferences.getString('role') ?? '';
  //     String image = sharedPreferences.getString('profile') ?? '';
  //           String ngoType = sharedPreferences.getString('ngotype') ?? '';

  //     ngoDetails = [
  //       {'key': 'username', 'value': username},
  //       {'key': 'email', 'value': email},
  //       {'key': 'location', 'value': location},
  //       {'key': 'role', 'value': role},
  //       {'key': 'profile', 'value': image},
  //       {'key': 'ngoType', 'value':ngoType },

  //     ];
  //     notifyListeners();
  //   } catch (e) {
  //     print("Error retrieving user details from SharedPreferences: $e");
  //   }
  // }
}
