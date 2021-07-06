import 'package:dev_stat/app/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Button {
  static flatterButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 7.h,
        color: Colors.white,
        child: Center(
            child: Text(
          'Check Status',
          style: TextStyle(
            color: AppColors.deepBlue,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
