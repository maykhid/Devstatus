import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContainerTextFormField extends StatelessWidget {
  const ContainerTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 6.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          left: 3.h,
          right: 3.h,
        ),
        child: Center(
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.grey.shade500,
            cursorWidth: 0.2.w,
            cursorHeight: 5.h,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade500,
            ),
            decoration: new InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
