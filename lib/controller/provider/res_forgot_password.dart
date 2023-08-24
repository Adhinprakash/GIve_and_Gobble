import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/api/api_url.dart';

class ResForgotpassword extends ChangeNotifier {
  final resemailcontroller = TextEditingController();
  final otpcontroller = TextEditingController();
  final emailorusername = TextEditingController();
  final newpasswordcontroller = TextEditingController();
  String uId = '';
  Future<int> enterOtp() async {
    final String email = resemailcontroller.text;
    try {
      final response = await http
          .post(Uri.parse(Api.resforogt), body: {'identifier': email});
      final Map<String, dynamic> data = json.decode(response.body);
      uId = data["uId"];
      if (response.statusCode == 200) {
        notifyListeners();
        return 200;
      } else {
        notifyListeners();
        return 401;
      }
    } catch (e) {
      notifyListeners();
      return 500;
    }
  }

  Future<int> confirmOtp() async {
    final String otp = otpcontroller.text;

    try {
      final response = await http
          .post(Uri.parse(Api.resenterotp + uId), body: {"enteredOtp": otp});

      if (response.statusCode == 200) {
        notifyListeners();
        return 200;
      } else if (response.statusCode == 400) {
        notifyListeners();
        return 400;
      } else {
        notifyListeners();
        return 401;
      }
    } catch (e) {
      notifyListeners();
      return 500;
    }
  }

  Future<int> savePassword() async {
    final email = resemailcontroller.text;
    final newpassword = newpasswordcontroller.text;
    try {
      final response = await http.patch(Uri.parse(Api.ressavepassword),
          body: {"identifier": email, "password": newpassword});
      if (response.statusCode == 201) {
        notifyListeners();
        return 201;
      } else {
        return 401;
      }
    } catch (e) {
      return 500;
    }
  }
}
