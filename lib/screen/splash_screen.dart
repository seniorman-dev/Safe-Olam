import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/screen/home_screen.dart';
import 'package:olam_grains/screen/login_screen.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Image.asset('assets/png/olam_orange.png')
        /*Icon(
          Icons.settings_outlined,
          color: AppTheme.mainColor,
          size: 200.h,
        )*/  //color: Colors.black,
      ), 
      nextScreen: LoginScreen(), 
      duration: 2000, //4000
      backgroundColor: AppTheme.backgroundColor, 
      centered: true,
      splashIconSize: 500.h,  //700,
      //splashTransition: SplashTransition.scaleTransition,
      animationDuration: Duration(seconds: 2),  //2
    );
  }
}