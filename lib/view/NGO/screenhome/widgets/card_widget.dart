import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';

class CardWidgetNgo extends StatelessWidget {
  CardWidgetNgo({super.key, required this.text, required this.count});
  final String text;
  final String? count;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 30,
      child: SizedBox(
        height: 95,
        width: 95,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count!,
              style:
                  textStyleFuc(weight: FontWeight.w100, color: kpink, size: 20),
            ),
            Text(
              text,
              style: textStyleFuc(
                  weight: FontWeight.w100, color: kBlack, size: 13),
            )
          ],
        ),
      ),
    );
  }
}
