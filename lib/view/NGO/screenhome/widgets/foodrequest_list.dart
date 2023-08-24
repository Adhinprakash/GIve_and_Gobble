import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/foodrequests/foodrequest.dart';
import 'package:give_gobble/model/selected_request_model/selected_requests/selected_requests/selected_requests.dart';
import 'package:give_gobble/model/selected_userdetails_model/user_details/user_details.dart';
import 'package:give_gobble/view/NGO/fooddetais/screen_details.dart';
import 'package:provider/provider.dart';

  class RequestListWidget extends StatelessWidget {
    const RequestListWidget({
      super.key,
      required this.foods,
      required this.people,
      required this.time,
      required this.location,
      required this.id,
      required this.image,
    });
    final String? foods;
    final String? people;
    final String? time;
    final String? location;
    final String id;
    final String image;
    @override
    Widget build(BuildContext context) {
      return Consumer<UserFoodrequests>(
        builder: (context, value, _) {
          return ListTile(
            onTap: () async {
             Map<String,dynamic>?responseData=await value.selectedrequest(id);
              if (responseData!=null) {
                SelectedRequests selectedRequests=SelectedRequests.fromJson(responseData['selectedRequest']);
                UserDetails userDetails=UserDetails.fromJson(responseData['user']);
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RequestDetails(
                            name: userDetails.username,
                            image:selectedRequests.image ,
                            foods: selectedRequests.title,
                            people:selectedRequests.quantity.toString(),
                            time:selectedRequests.time ,
                            location: selectedRequests.location,
                            id: id,
                            userimage:userDetails.profile ,
                          )),
                );
              } 
            },
            leading: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 4))
                  ]),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foods!,
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: kBlack, size: 17),
                ),
                Text(
                  people!,
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: Colors.grey, size: 11),
                ),
                Text(
                  time!,
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: Colors.grey, size: 11),
                ),
                Text(
                  location!,
                  style: textStyleFuc(
                      weight: FontWeight.w300, color: Colors.grey, size: 11),
                )
              ],
            ),
          );
        },
      );
    }



  }
