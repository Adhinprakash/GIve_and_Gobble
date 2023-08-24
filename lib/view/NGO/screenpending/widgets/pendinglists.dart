import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/foodrequests/foodrequest.dart';
import 'package:give_gobble/model/selected_request_model/selected_requests/selected_requests/selected_requests.dart';
import 'package:give_gobble/model/selected_userdetails_model/user_details/user_details.dart';
import 'package:give_gobble/view/NGO/screenpending/pendingcompleted/screen_pending_completed.dart';
import 'package:provider/provider.dart';

class PendingListWidget extends StatelessWidget {
  const PendingListWidget(
      {super.key,
      required this.food,
      required this.people,
      required this.time,
      required this.location,
      
      required this.id});
  final String? food;
  final String? people;
  final String? time;
  final String? location;
  final String id;
  
  @override
  Widget build(BuildContext context) {
    return Consumer<UserFoodrequests>(
      builder: (context, value, child) {
        return ListTile(
        onTap: () async{
        Map<String,dynamic>?responseData=await value.selectedrequest(id);

        if(responseData!=null){
                SelectedRequests selectedRequests=SelectedRequests.fromJson(responseData['selectedRequest']);
                UserDetails userDetails=UserDetails.fromJson(responseData['user']);

           // ignore: use_build_context_synchronously
           Navigator.push(
            
            context,
            MaterialPageRoute(
                builder: (context) => ScreenAccepedCompleted(
                  image: selectedRequests.image,
                  name: userDetails.username,
                  userimage: userDetails.profile,
                      food: selectedRequests.title,
                      people: selectedRequests.quantity.toString(),
                      time: selectedRequests.time,
                      id: id,
                      location: selectedRequests.location,
                    )),
          );

        }

      
        },
        leading: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(
                    "assets/Paneer masala.jfif",
                  ),
                  fit: BoxFit.fill),
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
              food!,
              style:
                  textStyleFuc(weight: FontWeight.w600, color: kBlack, size: 17),
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
