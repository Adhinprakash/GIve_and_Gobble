import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:sizer/sizer.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.text, required this.image});
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.sp,
      height: 70.sp,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600,
                offset: const Offset(4, 4),
                blurRadius: 15,
                spreadRadius: 1),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            width: 45,
            height: 45,
          ),
          Text(
            text,
            style:
                textStyleFuc(weight: FontWeight.w300, color: kBlack, size: 10),
          )
        ],
      ),
    );
  }
}
