import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/api/api_url.dart';
import 'package:give_gobble/model/food_request_mode/food_request_mode.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserFoodrequests extends ChangeNotifier {
  FoodRequestModel? food;
  List pendingRequest = [];
  List acceptedrequest = [];
  List completedreqlist = [];
  List selectedRequest = [];
  List userreqdetais=[];
  List restaurantdetails =[];
      List<dynamic> result = [];

List allngos=[];
  quantity(value) {
    currentvlue = value;
    notifyListeners();
  }




  TimeOfDay timeOfDay = const TimeOfDay(hour: 8, minute: 30);

  Future<void > showTimepickerDialoag(context) async {
    final TimeOfDay? selectedtime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (selectedtime != null && selectedtime != timeOfDay) {
      timeOfDay = selectedtime;
      notifyListeners();
    }
  }


String getFormattedTimeWithAMPM(TimeOfDay timeOfDay) {
  final int hour = timeOfDay.hour;
  final int minute = timeOfDay.minute;
  final String period = hour < 12 ? 'AM' : 'PM';

  final String formattedHour = (hour % 12 == 0 ? 12 : hour % 12).toString();
  final String formattedMinute = minute.toString().padLeft(2, '0');
  return '$formattedHour:$formattedMinute $period';

}


  final titlecontroller = TextEditingController();
  double currentvlue = 0;
  final locationcontroller = TextEditingController();

  Future<int> postFoodReqest(context) async {

 
    FoodRequestModel foodreqmodel = FoodRequestModel(
        title: titlecontroller.text,
        time: timeOfDay.format(context).toString(),
        location: locationcontroller.text,
        quantity: currentvlue.toString());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String useraccess = sharedPreferences.getString('userAccess')!;

    try {
      final response = await http.post(Uri.parse(Api.userFoodreq),
          headers: {
            'Authorization': 'Bearer $useraccess',
          },
          body: foodreqmodel.toJson());


      if (response.statusCode == 200) {

        notifyListeners();

        return 201;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      notifyListeners();
      return 500;
    }
  }

  // if it is a restaurant

  Future<int> respostFoodReqest(context) async {
    FoodRequestModel foodreqmodel = FoodRequestModel(
        title: titlecontroller.text,
        time: timeOfDay.format(context).toString(),
        location: locationcontroller.text,
        quantity: currentvlue.toString());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String resAccess = sharedPreferences.getString('resAccess')!;
    try {
      final response = await http.post(Uri.parse(Api.userFoodreq),
          headers: {
            'Authorization': 'Bearer $resAccess',
          },
          body: foodreqmodel.toJson());

      if (response.statusCode == 200) {

        notifyListeners();

        return 201;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      notifyListeners();
      return 500;
    }
  }

// to get req in the home
  Future<bool> getrequests() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      String ngoaccess = sharedPreferences.getString('ngoAccess')!;

      final response = await http.get(Uri.parse(Api.getpending), headers: {
        'Authorization': 'Bearer $ngoaccess',
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        pendingRequest = data["pendingRequests"];
        // food = FoodRequestModel.fromJson(data);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      notifyListeners();
      return false;
    }
  }

// to accept the request
  Future<bool> acceptrequest(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ngoaccess = sharedPreferences.getString('ngoAccess')!;
    try {
      final response = await http.patch(Uri.parse(Api.accept + id), body: {
        "_id": id
      }, headers: {
        'Authorization': 'Bearer $ngoaccess',
      });

      if (response.statusCode == 200) {
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

// To get the acceptedreq

  Future<bool> getaccepted() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      String ngoaccess = sharedPreferences.getString('ngoAccess')!;

      final response = await http.get(Uri.parse(Api.getaccept), headers: {
        'Authorization': 'Bearer $ngoaccess',
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        acceptedrequest = data["acceptedRequests"];
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      notifyListeners();
      return false;
    }
  }

// To completereq

  Future<bool> completereq(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ngoaccess = sharedPreferences.getString('ngoAccess')!;
    try {
      final response = await http.patch(Uri.parse(Api.copletereq + id), body: {
        "_id": id
      }, headers: {
        'Authorization': 'Bearer $ngoaccess',
      });

      if (response.statusCode == 200) {
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
//  to get the complete req

  Future<bool> getcompleted() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      String ngoaccess = sharedPreferences.getString('ngoAccess')!;

      final response = await http.get(Uri.parse(Api.getcomplete), headers: {
        'Authorization': 'Bearer $ngoaccess',
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        completedreqlist = data["completedRequests"];
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

  Future<Map<String, dynamic>?> selectedrequest(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ngoaccess = sharedPreferences.getString('ngoAccess')!;
    try {
      final response =
          await http.get(Uri.parse(Api.getselected + id), headers: {
        'Authorization': 'Bearer $ngoaccess',
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        notifyListeners();

        return responseData;
      } else {
        notifyListeners();
        return null;
      }
    } catch (e) {
      notifyListeners();
      return null;
    }
  }

  Future<bool> userdonationdeatails() async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
 String userid = sharedPreferences.getString('userId')!;
    String useraccess = sharedPreferences.getString('userAccess')!;
    try{
    final response = await http.get(
      Uri.parse(Api.userdonation+userid),
      headers: {'Authorization':'Bearer $useraccess'
      },
    );

    if(response.statusCode==200){   
       Map<String,dynamic>data=jsonDecode(response.body);
    userreqdetais=data['requestHistory'];
    notifyListeners();
      return true;
    }
    else{
      notifyListeners();
      return false;
    }
    }catch(e){
return false;
    }

  }



  
  Future<bool> resdonationdeatails() async {
        SharedPreferences pref = await SharedPreferences.getInstance();
 String resId = pref.getString('resId')!;
    String resaccess = pref.getString('resAccess')!;
    try{
    final response = await http.get(
      Uri.parse(Api.restaurantdonation+resId),
      headers: {'Authorization':'Bearer $resaccess'
      },
    );

    if(response.statusCode==200){   
       Map<String,dynamic>data=jsonDecode(response.body);
    restaurantdetails=data['requestHistory'];
    notifyListeners();
      return true;
    }
    else{
      notifyListeners();
      return false;
    }
    }catch(e){
return false;
    }

  }


Future<bool>getAllngos()async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  String ngoAccess=sharedPreferences.getString('ngoAccess')!;
  try{
    final response = await http.get(Uri.parse(Api.ngoslist),headers: {'Authorization':'Bearer $ngoAccess'});
if(response.statusCode==201){
Map<String,dynamic>responseData=jsonDecode(response.body);
allngos=responseData['ngos'];

  notifyListeners();
return true;
}else{
  notifyListeners();
  return false;

}
  }catch(error){
    notifyListeners();
return false;
  }
}


  //     Future<void> searchResu(String text) async {
  //   if (text.isEmpty) {
  //     result = allngos;
  //   } else {
  //     result = allngos
  //         .where((element) =>
  //             element['username'].toLowerCase().contains(text.toLowerCase()))
  //         .toList();
  //   }
  //   notifyListeners();
  // }

}
