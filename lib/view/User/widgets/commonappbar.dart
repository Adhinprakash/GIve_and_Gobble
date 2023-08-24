import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';

class CommonAppbarwidget extends StatelessWidget {
  const CommonAppbarwidget({
    super.key,
    required this.title,
    required this.leading,
    required this.color,
    required this.buttoncolor,
  });
  final String title;
  final IconData leading;
  final Color color;
  final Color buttoncolor;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kwhite,
      shadowColor: Colors.grey,
      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListTile(
        leading: IconButton(
          onPressed: () {
          Navigator.pop(context);
//             Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => ScreenMainPage()),
// );
          },
          icon: Icon(leading),
          color: buttoncolor,
        ),
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Text(
            title,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )),
      ),
    );
  }
}
