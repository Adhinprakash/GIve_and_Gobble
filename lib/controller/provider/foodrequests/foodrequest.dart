import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/api/api_url.dart';
import 'package:give_gobble/model/food_request_mode/food_request_mode.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class UserFoodrequests extends ChangeNotifier{

 quantity(value){
currentvlue=value;
notifyListeners();
}



 TimeOfDay timeOfDay = TimeOfDay(hour: 8, minute: 30);

  Future showTimepickerDialoag(context) async {
    final TimeOfDay? selectedtime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (selectedtime != null && selectedtime != timeOfDay) {
      timeOfDay = selectedtime;
      notifyListeners();
    }
  }




  final  titlecontroller = TextEditingController();
 double  currentvlue=0;
  final locationcontroller = TextEditingController();
  

Future<int>postFoodReqest()async{

  
  FoodRequestModel foodreqmodel=FoodRequestModel(title: titlecontroller.text, time: timeOfDay.toString(), location: locationcontroller.text, quantity: currentvlue.toString());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String useraccess= sharedPreferences.getString('userAccess')!;
  print(useraccess);
  try{
final response=await  http.post(Uri.parse(Api.userFoodreq),headers: {
        'Authorization': 'Bearer $useraccess',
      },
      body:jsonEncode(foodreqmodel.toJson())
      
      );

      if(response.statusCode==200){
        print(response.body);

notifyListeners();

return 201;

      }

  
else{
  print(response.body);
    print(response.statusCode);

}
}catch(e){
  notifyListeners();
return 500;
}



}

}