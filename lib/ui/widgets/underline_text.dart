import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UnderlinedText extends StatelessWidget {
  final String text;
  UnderlinedText({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 5, // Space between underline and text
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.5.w, // Underline thickness
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}