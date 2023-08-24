import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/foodrequests/foodrequest.dart';
import 'package:give_gobble/controller/provider/restarant_signup.dart';
import 'package:give_gobble/view/Restaurant/widgets/donation_appbara_widget.dart';
import 'package:give_gobble/view/Restaurant/widgets/textformfield_widget.dart';
import 'package:provider/provider.dart';

class ScreenRestaurantDonation extends StatefulWidget {
  const ScreenRestaurantDonation({super.key});

  @override
  State<ScreenRestaurantDonation> createState() =>
      _ScreenRestaurantDonationState();
}

class _ScreenRestaurantDonationState extends State<ScreenRestaurantDonation> {
  bool _isChecked = false;

  double currentvalue = 0;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    UserFoodrequests requestdata =
        Provider.of<UserFoodrequests>(context, listen: false);

    return ListView(
      children: [
        const RestaurantAppbarWidet(
            title: 'Create New Post',
            leading: Icons.arrow_back,
            trailing: "Post"),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight30,
              Row(children: [
                Image.asset(
                  "assets/reastaurant final.png",
                  width: 80,
                  height: 80,
                ),
                kwidth15,
                Consumer<RestaurantProvider>(
                  builder: (context, value, child) {
                    return  Text(
                  value.restaurantdetails.firstWhere(
                            (item) => item['key'] == 'restaurant')['value']!,
                    style: textStyleFuc(
                        weight: FontWeight.w600, color: kBlack, size: 15),
                  );
                  },
                  
                )
              ]),
              kheight30,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ResTextFormfieldWidget(
                  labelText: "Enter Food details",
                  controller: requestdata.titlecontroller,
                ),
              ),
              kHeight15,
              Padding(
                padding: const EdgeInsets.all(10),
                child: Consumer<UserFoodrequests>(
                  builder: (context, quantitynotifier, child) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Food Quantity",
                              style: textStyleFuc(
                                  weight: FontWeight.w600,
                                  color: kBlack,
                                  size: 18),
                            ),
                            Text(
                                quantitynotifier.currentvlue.round().toString())
                          ],
                        ),
                        Center(
                          child: SizedBox(
                            width: 420,
                            child: Slider(
                                activeColor: kpurple,
                                min: 0,
                                max: 200,
                                divisions: 200,
                                value: quantitynotifier.currentvlue,
                                onChanged: (value) {
                                  setState(() {
                                    quantitynotifier.quantity(value);
                                  });
                                }),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              kheight30,
              Text(
                "cooking time",
                style: textStyleFuc(
                    weight: FontWeight.w600, color: kBlack, size: 18),
              ),
              kheight30,
              Consumer<UserFoodrequests>(
                builder: (context, timenotifier, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.alarm),
                          kwidth15,
                          Text(
                              timenotifier.getFormattedTimeWithAMPM(timenotifier.timeOfDay))
                        ],
                      ),
                      TextButton(
                          onPressed: () async {
                            timenotifier.showTimepickerDialoag(context);
                          },
                          child: Text(
                            "Select",
                            style: textStyleFuc(
                                weight: FontWeight.w500,
                                color: kpink,
                                size: 15),
                          ))
                    ],
                  );
                },
              ),
              Center(
                child: Text(
                  "Address",
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: kBlack, size: 20),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      value: value,
                      onChanged: (value) {
                        _isChecked = value ?? false;
                        if (_isChecked) {
                          _getCurrentLocation();
                        }
                      }),
                  kwidth15,
                  Text(
                    "Use my current location",
                    style: textStyleFuc(
                        weight: FontWeight.w200, color: kBlack38, size: 14),
                  ),
                ],
              ),
              kHeight15,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "Pick up address",
                  style: textStyleFuc(
                      weight: FontWeight.w400, color: kBlack, size: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ResTextFormfieldWidget(
                    controller: requestdata.locationcontroller,
                    labelText: "Enter your food pickup address"),
              ),
              kheight30,
              Center(
                  child: SizedBox(
                      width: 400,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          int requestsuccess =
                              await Provider.of<UserFoodrequests>(context,
                                      listen: false)
                                  .respostFoodReqest(context);

                          if (requestsuccess == 201) {
                            // ignore: use_build_context_synchronously
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.TOPSLIDE,
                              showCloseIcon: true,
                              title: "Food request completed!",
                              desc: "Thank you for donating food",
                            ).show();
                            // ignore: use_build_context_synchronously
                            Provider.of<UserFoodrequests>(context,
                                    listen: false)
                                .locationcontroller
                                .clear();
                            // ignore: use_build_context_synchronously
                            Provider.of<UserFoodrequests>(context,
                                    listen: false)
                                .titlecontroller
                                .clear();
                          } else {
                            // ignore: use_build_context_synchronously
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.TOPSLIDE,
                              showCloseIcon: true,
                              title: "error!",
                              desc: "food request completed",
                            ).show();
                          }
                        },
                        style:
                            ElevatedButton.styleFrom(backgroundColor: kpurple),
                        child: Text(
                          "Post",
                          style: textStyleFuc(
                              weight: FontWeight.w500,
                              color: Colors.white,
                              size: 22),
                        ),
                      )))
            ],
          ),
        )
      ],
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

      String? locationString;

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address =
            "${placemark.thoroughfare} ${placemark.locality}, ${placemark.administrativeArea},";
        locationString = " $address";
      }

      setState(() {
        Provider.of<UserFoodrequests>(context, listen: false)
            .locationcontroller
            .text = locationString!;
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
