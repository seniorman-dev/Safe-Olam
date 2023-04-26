import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/widget/home/logout/log_out.dart';
import 'package:olam_grains/widget/home/report_event/report_event_bottom_sheet.dart';
import 'package:olam_grains/widget/home/reported_events/reported_events.dart';
import 'package:olam_grains/widget/home/reported_events/specific_plant_events/plant/specific_plant_reported_event.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.backgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildBody(context,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          mini: false,
          backgroundColor: AppTheme.orangeColor,
          onPressed: () {
            showLogoutDialogue(context);
          },
          tooltip: 'Exit',
          child: Icon(
            Icons.logout_rounded,
            color: AppTheme.whiteColor,
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context,) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 150.h,),
          InkWell(
            onTap: () {
              reportEventBottomSheet(context: context);
            },
            child: Container(
              height: 200.h,
              width: double.infinity,
              alignment: Alignment.center,
              //padding: EdgeInsets.all(15.h),
              //margin: EdgeInsets.only(bottom: 15.h),
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 13.w
              ),
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0.1.r,
                    blurRadius: 8.0.r,
                  )
                ],
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.h,),
                    Icon(
                      Icons.assignment_add,
                      color: AppTheme.orangeColor,
                      size: 60.h,
                    ),
                    SizedBox(height: 20.h,),
                    Text(
                      'Report an event',
                      style: TextStyle(
                        color: AppTheme.orangeColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h,),
          InkWell(
            onTap: () {
              Get.to(() => ReportedEvents());
            },
            child: Container(
              height: 200.h,
              width: double.infinity,
              alignment: Alignment.center,
              //padding: EdgeInsets.all(15.h),
              //margin: EdgeInsets.only(bottom: 15.h),
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 13.w
              ),
              decoration: BoxDecoration(
                color: AppTheme.orangeColor,
                borderRadius: BorderRadius.circular(15.r),
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
                children: [
                  SizedBox(height: 40.h,),
                  Icon(
                    Icons.bookmark_added,
                    color: AppTheme.whiteColor,
                    size: 60.h,
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    'View reported events',
                    style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.h,),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Want to view reported events from your plant?',
                  style: TextStyle(
                    color: AppTheme.darkGreyText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10.h,),
                InkWell(
                  onTap: () {
                    Get.to(() => SpecificPlantEvents());
                  },
                  child: Text(
                    'click here',
                    style: TextStyle(
                      color: AppTheme.orangeColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                    ),
                  ),
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}