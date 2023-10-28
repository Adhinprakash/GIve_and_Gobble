import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/ngo_login.dart';
import 'package:give_gobble/view/NGO/Ngoprofile/sceen_editprofile.dart';
import 'package:give_gobble/view/User/widgets/commonappbar.dart';
import 'package:give_gobble/view/landingpages/landing_pages.dart';
import 'package:provider/provider.dart';

class ScreenNgoProfile extends StatelessWidget {
  const ScreenNgoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    //  Provider.of<NgoLogin>(context,listen:false).getNgoDetailsFromSharedPreferences();

    return Consumer<NgoLogin>(
      builder: (context, ngodetailsnotifier, _) {
        return ListView(
          children: [
            Column(
              children: [
                CommonAppbarwidget(
                    title: "Profile",
                    leading: Icons.arrow_back,
                    color: kBlack,
                    buttoncolor: kBlack),
                Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Stack(
                      children: [
                        SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.network(
                              ngodetailsnotifier.ngodetails.firstWhere(
                                  (item) => item['key'] == 'profile',
                                  orElse: () => {'value': 'N/A'})['value'],
                            )),
                        // Positioned(
                        //     bottom: 9,
                        //     right: 30,
                        //     child: CircleAvatar(
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) =>
                        //                     const ScreenEditNgoProfile()),
                        //           );
                        //         },
                        //         child: const SizedBox(
                        //             height: 40,
                        //             width: 40,
                        //             child: Icon(Icons.edit)),
                        //       ),
                        //     ))
                      ],
                    )),
                Text(ngodetailsnotifier.ngodetails.firstWhere(
                    (item) => item['key'] == 'ngoname',
                    orElse: () => {'value': 'N/A'})['value']),
                kheight30,
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("NGO name:",
                              style: textStyleFuc(
                                  weight: FontWeight.w700,
                                  color: kBlack,
                                  size: 16)),
                          Text(ngodetailsnotifier.ngodetails.firstWhere(
                              (item) => item['key'] == 'ngoname',
                              orElse: () => {'value': 'N/A'})['value']),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Email:",
                            style: textStyleFuc(
                                weight: FontWeight.w700,
                                color: kBlack,
                                size: 16),
                          ),
                          Text(ngodetailsnotifier.ngodetails.firstWhere(
                              (item) => item['key'] == 'email',
                              orElse: () => {'value': 'N/A'})['value']),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ngo Type:",
                              style: textStyleFuc(
                                  weight: FontWeight.w700,
                                  color: kBlack,
                                  size: 16)),
                          Text(ngodetailsnotifier.ngodetails.firstWhere(
                              (item) => item['key'] == 'ngoType',
                              orElse: () => {'value': 'N/A'})['value']),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Address:",
                              style: textStyleFuc(
                                  weight: FontWeight.w700,
                                  color: kBlack,
                                  size: 16)),
                          Text(ngodetailsnotifier.ngodetails.firstWhere(
                              (item) => item['key'] == 'location',
                              orElse: () => {'value': 'N/A'})['value']),
                        ],
                      ),
                    ],
                  ),
                ),
                kheight30,
                TextButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Logout Confirmation'),
                          content:
                              const Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                // Access the UserLogin class using Provider and call the logout method.

                                bool logout = await Provider.of<NgoLogin>(
                                        context,
                                        listen: false)
                                    .ngologout(context);
                                if (logout) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LandingPages(),
                                    ),
                                    (route) => false,
                                  );
                                  // ignore: use_build_context_synchronously
                                  Provider.of<NgoLogin>(context, listen: false)
                                      .emailOResnamecontroller
                                      .clear();
                                }
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      "Logout",
                      style: textStyleFuc(
                          weight: FontWeight.w600, color: Colors.red, size: 20),
                    ))
              ],
            ),
          ],
        );
      },
    );
  }
}
