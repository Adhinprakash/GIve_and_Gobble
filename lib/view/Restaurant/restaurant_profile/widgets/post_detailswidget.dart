import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';

class ResProfiledetails extends StatelessWidget {
  const ResProfiledetails({super.key, required this.icon, required this.text});
final IconData icon;
final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Icon(icon),
      kwidth15,
      Text(text,style: textStyleFuc(weight: FontWeight.w300, color: kBlack38, size: 14),),

      ],
    );
  }
}