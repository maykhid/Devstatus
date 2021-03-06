import 'package:dev_stat/app/consts/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Button {
  static flatterButton({
    Function()? onTap,
    bool isLoading = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 5.h,
        color: Colors.white,
        child: Center(
          child: !isLoading
              ? Text(
                  'Check Status',
                  style: TextStyle(
                    color: AppColors.deepBlue,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Text(
                  'Please Wait...',
                  style: TextStyle(
                    color: AppColors.deepBlue.withOpacity(0.4),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
