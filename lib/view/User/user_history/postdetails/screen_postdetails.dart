import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/User/widgets/commonappbar.dart';
import 'package:sizer/sizer.dart';

class POstDetails extends StatelessWidget {
  const POstDetails({super.key, this.image, this.title, this.quantity, this.loction, this.time});
final String? image;
final String? title;
final String? quantity;
final String? loction;
final String? time;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppbarwidget(
                title: "Post details",
                leading: Icons.arrow_back,
                color: kBlack,
                buttoncolor: kBlack),
            Container(
              width: 100.w,
              height: 40.h,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image!),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              width: 80.w,
              height: 47.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 26,top: 26,bottom: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title!,
                          style: textStyleFuc(
                              weight: FontWeight.w700, color: kBlack, size: 22),
                        ),
                      
                        kHeight15,
                        Text(
                          "Cooking time",
                          style: textStyleFuc(
                              weight: FontWeight.w600, color: kBlack, size: 15),
                        ),
                        Text(time!),
                        kheight30,
                        Text(
                          "Quantity",
                          style: textStyleFuc(
                              weight: FontWeight.w600, color: kBlack, size: 15),
                        ),
                         Text("food for $quantity people"),
                        kheight30,
                        Text(
                          " Address",
                          style: textStyleFuc(
                              weight: FontWeight.w600, color: kBlack, size: 15),
                        ),
                        Padding(
                          padding:  const EdgeInsets.only(left: 7),
                          child: Text(loction!),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
