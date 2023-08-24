import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/Restaurant/widgets/common_appbarwidget.dart';
import 'package:sizer/sizer.dart';

class ResPostDetails extends StatelessWidget {
  const ResPostDetails({super.key, this.image, this.title, this.quantity, this.loction, this.time});
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
            RestCommonAppbarwidget(
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
              width: 100.w,
              height: 45.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(26),
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
                         Text(loction!),
                      ],
                    ),
                  ),
                  Text(
                    "Open location in map",
                    style: textStyleFuc(
                        weight: FontWeight.w400, color: kpink, size: 15),
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
