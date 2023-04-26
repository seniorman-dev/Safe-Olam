import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/screen/login_screen.dart';
import 'package:olam_grains/util/loading_dialog_box.dart';





///Alert Dialog for get support page
  Future showLogoutDialogue(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.whiteColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 40.w, //50.w
            vertical: 40.h, //50.h
          ),
          content: SizedBox(
            height: 150,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Are you sure you want to exit?',
                    style: TextStyle(
                      color: AppTheme.lightGreyText,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.offAll(() => LoginScreen());
                              //showLoadingDialog(context).whenComplete(() => Get.offAll(() => LoginScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),
                              side: BorderSide(
                                color: AppTheme.orangeColor,
                                style: BorderStyle.solid
                              ),
                              backgroundColor: AppTheme.whiteColor,
                              foregroundColor: AppTheme.whiteColor,
                              minimumSize:const Size(double.infinity, 50)
                            ),
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                color: AppTheme.orangeColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0)
                                )
                              ),
                              side: BorderSide(
                                color: AppTheme.orangeColor,
                                  style: BorderStyle.solid
                              ),
                              backgroundColor: AppTheme.orangeColor,
                              foregroundColor: AppTheme.orangeColor,
                              minimumSize:const Size(double.infinity, 50)
                            ),
                            child: Text(
                              "No",
                              style: TextStyle(
                                color: AppTheme.whiteColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }