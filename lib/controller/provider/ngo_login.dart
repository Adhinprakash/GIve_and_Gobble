
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/api/api_url.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class NgoLogin extends ChangeNotifier {
  final emailOResnamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();


 bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  } 



  Future<bool> ngologin(context) async {
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
        prefs.setBool('isNgoLoggedIn', true);

        emailOResnamecontroller.clear();
        passwordcontroller.clear();

  notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
        // Handle other status codes (e.g., 500 for server error, etc.).
    
      }
    } catch (error) {
      // Handle error while making the HTTP request
    
      notifyListeners();
      return false;
    }
  
  }



  Future<bool> ngologout(BuildContext context) async {
    // Clear user login state and user information from shared preferences.
    try{
    _setIsLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isNgoRegistered');
    prefs.remove('isNgoLoggedIn');
    prefs.remove('userId');
    prefs.remove('userRole');
    prefs.remove('accessToken');
    prefs.remove('refreshToken');
    _setIsLoading(false);
    notifyListeners();
return true;
    }
    catch(e){
      notifyListeners();
return false;
    }
    // Navigate to the login page after logout.
    // ignore: use_build_context_synchronously

  }
}
