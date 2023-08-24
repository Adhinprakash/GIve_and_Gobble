import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:sizer/sizer.dart';

class ResnewslistWidget extends StatelessWidget {
  const ResnewslistWidget({super.key, this.image, this.desc, this.title});
  final String? image;
  final String? desc;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 90.w,
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 4))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image.network(
              image!,
              width: 380,
              height: 250,
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 122, 93, 170),
                        borderRadius: radius4),
                    child: Text(
                      title!,
                      style: textStyleFuc(
                          weight: FontWeight.w300, color: kwhite, size: 14),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 10),
                  child: Text(
                    desc!,
                    style: textStyleFuc(
                        weight: FontWeight.w500, color: kBlack, size: 15),
                  ),
                ),
                kHeight15,
                Center(
                    child: Text(
                  "read more",
                  style: textStyleFuc(
                      weight: FontWeight.normal, color: Colors.grey, size: 14),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
