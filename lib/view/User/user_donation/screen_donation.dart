import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/time_picking.dart';
import 'package:give_gobble/view/User/appbar__widget.dart';
import 'package:give_gobble/view/User/widgets/textformfield_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ScreenDonation extends StatefulWidget {
  const ScreenDonation({super.key});

  @override
  State<ScreenDonation> createState() => _ScreenDonationState();
}


class _ScreenDonationState extends State<ScreenDonation> {
  @override
  void dispose() {
    _locationController.clear();

    super.dispose();
  }
    TextEditingController _locationController = TextEditingController();
  bool _isChecked = false;

  double currentvalue=0;
bool value=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
         const DonationPageAppbar(title: 'Create New Post', leading:Icons.arrow_back, trailing: "Post"),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight30,
                Row(children: [
                   Image.asset("assets/valunteer-removebg-preview (1).png",width: 80,height: 80,),
                   kwidth15,
                  Text(
                    "Adhin prakash",
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: kBlack, size: 15),
                  )
                ]),
                kheight30,
                 const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:TextFormfieldWidget(labelText: "Enter Food details", ),
                ),
                kHeight15,
                Padding(
                  padding:  const EdgeInsets.only(left:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween
                    ,
                    children: [
                      Text("Food Quantity",style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 18),),
                      Text("${currentvalue.round()} person")
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 90.w,
                    child: Slider(
                      activeColor: kpurple,
                      min: 0,
                      max: 200,
                    divisions: 200,
                      value: currentvalue, onChanged: (value){
                        
                      setState(() {
                        currentvalue=value;
                      });
                    }),
                  ),
                ),
                kHeight15,
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("cooking time",style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 18),),
                ),
                kHeight15,
                
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Consumer<ShowTimePicker>(
                  builder: (context, value, _) {
                    return  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Row(
                          children: [
                           const Icon(Icons.alarm),
                           kwidth15,
                           Text(value.timeOfDay.format(context).toString())
                          ],
                        ),
                        TextButton(onPressed:()async{value.showTimepickerDialoag(context);} , child: Text("Select",style: textStyleFuc(weight: FontWeight.w500, color: kpink, size: 15),))
                      ],
                    );
                  },
                  
                ),
              ),
              kHeight15,
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("Address",style: textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 18),),
                ),
                Row(
                  children: [
                Checkbox(value: _isChecked, onChanged: (value){
                   _isChecked = value ?? false;
                      if (_isChecked) {
                        _getCurrentLocation();
                      }
                }),
                kwidth15,
               Text("Use my current location",style: textStyleFuc(weight: FontWeight.w200, color: kBlack38, size: 14),),
               
                  ],
                ),
                kHeight15,
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text("Pick up address",style: textStyleFuc(weight: FontWeight.w400, color: kBlack, size: 18),),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormfieldWidget(labelText: "Enter your food pickup address",controller: _locationController,),
                ),
                kheight30,
                Center(child: SizedBox(
                  width: 90.w,
                  height: 50,
                  child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: kpurple), child: Text("Post",style: textStyleFuc(weight: FontWeight.w500, color: Colors.white, size: 22),),)))
              ],
            ),
          )
        ],
      ),
    );
  }


Future<void> _getCurrentLocation() async {
  try {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // User denied the location permission.
      showSnackbar("Location permission denied.");
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    String? locationString ;

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      String address = "${placemark.thoroughfare} ${placemark.locality}, ${placemark.administrativeArea},";
      locationString = " $address";
    }

    setState(() {
      _locationController.text = locationString!;
    });

    showSnackbar("Current location: $locationString");
  } catch (e) {
    showSnackbar("Error getting current location: $e");
  }
}

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }


}
