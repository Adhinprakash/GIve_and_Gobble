import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/foodrequests/foodrequest.dart';
import 'package:give_gobble/view/User/widgets/commonappbar.dart';
import 'package:provider/provider.dart';

class ScreenAccepedCompleted extends StatelessWidget {
  const ScreenAccepedCompleted(
      {super.key,
      this.food,
      required this.people,
      this.time,
      this.location,
      required this.id, this.name, this.userimage, this.image});
  final String? food;
  final String? people;
  final String? time;
  final String? location;
  final String? id;
  final String? name;
  final String? userimage;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonAppbarwidget(
                  title: "Post details",
                  leading: Icons.arrow_back,
                  color: kBlack,
                  buttoncolor: kBlack),
              Container(
                width: 800,
                height: 350,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        image:NetworkImage(image!),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                width: 800,
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food!,
                            style: textStyleFuc(
                                weight: FontWeight.w700,
                                color: kBlack,
                                size: 22),
                          ),
                          Row(
                            children: [
                              Row(children: [
                                Image.network(
                                  userimage!,
                                  width: 60,
                                  height: 60,
                                ),
                                kwidth15,
                                Text(
                                  name!,
                                  style: textStyleFuc(
                                      weight: FontWeight.w600,
                                      color: kBlack,
                                      size: 15),
                                )
                              ]),
                            ],
                          ),
                          kHeight15,
                          Text(
                            "cooked time",
                            style: textStyleFuc(
                                weight: FontWeight.w600,
                                color: kBlack,
                                size: 15),
                          ),
                          Text(time!),
                          kheight30,
                          Text(
                            "Quantity",
                            style: textStyleFuc(
                                weight: FontWeight.w600,
                                color: kBlack,
                                size: 15),
                          ),
                          Text("food for ${people!} people"),
                          kheight30,
                          Text(
                            " Address",
                            style: textStyleFuc(
                                weight: FontWeight.w600,
                                color: kBlack,
                                size: 15),
                          ),
                          Text(location!),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 10),
                            child: Text(
                              "open Location in map",
                              style: textStyleFuc(
                                  weight: FontWeight.w400,
                                  color: kpink,
                                  size: 15),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              kHeight15,
              Center(
                child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool complete = await Provider.of<UserFoodrequests>(
                                context,
                                listen: false)
                            .completereq(id!);
                        if (complete) {
                          // ignore: use_build_context_synchronously
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            animType: AnimType.TOPSLIDE,
                            showCloseIcon: true,
                            title: "completed!",
                            desc:
                                "Food request complete\n Thank you for donating food",
                          ).show();
                        } else {}
                        // FocusScopeNode currentFocus = FocusScope.of(context);

                        // if (!currentFocus.hasPrimaryFocus) {
                        //   currentFocus.unfocus();
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text(
                        "Complete",
                        style: textStyleFuc(
                            weight: FontWeight.w500,
                            color: Colors.white,
                            size: 22),
                      ),
                    )),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
