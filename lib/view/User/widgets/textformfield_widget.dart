import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFormfieldWidget extends StatelessWidget {
  const TextFormfieldWidget(
      {super.key, required this.labelText, this.controller});
  final TextEditingController? controller;

  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey)),
        width: 80.w,
        height: 18.h,
        child: TextFormField(
          controller: controller,
          maxLines: 10,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            labelText: labelText,
            fillColor: const Color.fromARGB(255, 225, 45, 45),
          ),
        ),
      ),
    );
  }
}
