
import 'package:flutter/material.dart';

class ShowTimePicker extends ChangeNotifier{
TimeOfDay timeOfDay=TimeOfDay(hour: 8, minute: 30);



Future showTimepickerDialoag( context)async{
 
 final TimeOfDay? selectedtime= await  showTimePicker(
  
  context:context , initialTime: TimeOfDay.now());

if(selectedtime!=null &&  selectedtime!=timeOfDay){
  timeOfDay=selectedtime;
  notifyListeners();
}

 }
}