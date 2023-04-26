import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/styles/botton_styles.dart';





class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Button({
    Key? key,
    required this.text, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          //disabledBackgroundColor:AppTheme.darkBlueButtonColor.withOpacity(0.6),
          backgroundColor: AppTheme.orangeColor,
          minimumSize: Size.copy(Size(100.w, 50.h))
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: 18.sp
          ),
        ),
      ),
    );
  }
}
