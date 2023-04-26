import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/controllers/home/unsafe_act_controller.dart';
import 'package:olam_grains/util/appbar.dart';






class PlantUnsafeActDetailsPage extends StatelessWidget {
  PlantUnsafeActDetailsPage({super.key, required this.reporter, required this.eventLocation, required this.event, required this.eventDate, required this.eventTime, required this.eventPhoto, required this.plant, required this.country,});
  final String reporter;
  final String eventLocation;
  final String event;
  final String eventDate;
  final String eventTime;
  final String eventPhoto;
  final String plant;
  final String country;

  final UnSafeActController controller = UnSafeActController();

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.backgroundColor,
        appBar: CustomAppBar(title: 'Unsafe Act',),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildBody(context,),
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
          SizedBox(height: 70.h,),
          Text(
            "Reporter's name",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            //alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
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
            child: Text(
              reporter,   //reporter's name
              style: TextStyle(
                color: AppTheme.darkGreyText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 30.h,),
          Text(
            "Where did it happen?",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            //alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
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
            child: Text(
              eventLocation,   //event location
              style: TextStyle(
                color: AppTheme.darkGreyText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 30.h,),
          Text(
            "What happened?",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            //alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
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
            child: Text(
              event,   //event
              style: TextStyle(
                color: AppTheme.darkGreyText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 30.h,),
          Text(
            "When did it happen?",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            //alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
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
            child: Text(
              eventDate,   //event_date
              style: TextStyle(
                color: AppTheme.darkGreyText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 30.h,),
          Text(
            "Time of the event",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            //alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
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
            child: Text(
              eventTime,   //event_time
              style: TextStyle(
                color: AppTheme.darkGreyText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500
              ),
            ),
          ),


          /////
          SizedBox(height: 30.h,),
          Text(
            "Reporter's plant",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            //alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
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
            child: Text(
              plant,   //event_time
              style: TextStyle(
                color: AppTheme.darkGreyText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 30.h,),
          Text(
            "Reporter's country",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            //alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
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
            child: Text(
              country,   //event_time
              style: TextStyle(
                color: AppTheme.darkGreyText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          ///////
          
      
          SizedBox(height: 30.h,),
          Text(
            'Event image',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10.h,),
          //wrap with stream builder
          SizedBox(
            height: 700.h,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: eventPhoto,
              fit: BoxFit.fill
            ),
          ),
          SizedBox(height: 20.h,),

        ]
      )
    );
  }
  
}