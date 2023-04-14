import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olam_grains/constants/app_theme.dart';





Future<void> showLoadingDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pop(context);
        }
      );
      return AlertDialog(
        backgroundColor: AppTheme.whiteColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 50.w, //60.w
          vertical: 50.h, //60.h
        ),
        content: SizedBox(
          height: 100.h,
          width: 200.w,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 5, //4
              color: AppTheme.mainColor,
            ),
          ),
        ),
      );
    },
  );
}



