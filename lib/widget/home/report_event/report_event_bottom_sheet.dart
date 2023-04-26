import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/styles/botton_styles.dart';
import 'package:olam_grains/widget/home/report_event/near_miss.dart';
import 'package:olam_grains/widget/home/report_event/unsafe_act.dart';
import 'package:olam_grains/widget/home/report_event/unsafe_condition.dart';







Future<void> reportEventBottomSheet({required BuildContext context}) async {
  showModalBottomSheet(
    isScrollControlled: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 2,
    isDismissible: false,
    useSafeArea: true,
    backgroundColor: AppTheme.backgroundColor,
    //barrierColor: Theme.of(context).colorScheme.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20)
      )
    ),
    context: context, 
    builder: (context) {
      return Wrap(
        children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            //image: DecorationImage(image: AssetImage(''),),
            color: AppTheme.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 50.w,
                child: Divider(
                  thickness: 4,
                  color: AppTheme.darkGreyText.withOpacity(0.2),
                ),
              ),
              SizedBox(height: 32.h),
              //icon
              //SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.assignment_outlined,
                    color: AppTheme.orangeColor,
                    size: 50.h,
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    'Select Event',
                    style: TextStyle(
                      color: AppTheme.orangeColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),

              //change to svg
              /*Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset('assets/svg/cancel_icon.svg')
                )
                //Icon(Icons.cancel_rounded, color: AppTheme.darkBlueButtonColor,),
              ),
              SizedBox(height: 30.h),*/
              Container(
                //color: Colors.white,
                //semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                //shape: RoundedRectangleBorder(
                  //borderRadius: BorderRadius.circular(10.0),
                //),
                //elevation: 2,
                decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.1.r,
                      blurRadius: 8.0.r,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ////////////////////////
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => UnSafeAct());
                        }, 
                        child: Text(
                          'Unsafe Act',
                          style: TextStyle(
                            color: AppTheme.orangeColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Divider(
                        thickness: 1,
                        color: AppTheme.darkGreyText.withOpacity(0.2),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => UnSafeCondition());
                        }, 
                        child: Text(
                          'Unsafe Condition',
                          style: TextStyle(
                            color: AppTheme.orangeColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Divider(
                        thickness: 1,
                        color: AppTheme.darkGreyText.withOpacity(0.2),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => NearMiss());
                        }, 
                        child: Text(
                          'Near Miss',
                          style: TextStyle(
                            color: AppTheme.orangeColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ),
                    ),
                    ////////////////////////
                  ],
                ),           
              ),
              SizedBox(height: 50.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 70.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.orangeColor,
                        minimumSize: Size.copy(
                          Size(100.w, 55.h),
                        ),
                        maximumSize: Size.copy(
                          Size(100.w, 55.h),
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Cancel',
                        style: buttonTextStyle(context),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ],
          ),
        )
      ],
    );
    }
  );
}


