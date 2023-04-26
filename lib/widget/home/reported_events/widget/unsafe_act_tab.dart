import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/controllers/home/unsafe_act_controller.dart';
import 'package:olam_grains/util/loader.dart';
import 'package:olam_grains/util/util_functions.dart';
import 'package:olam_grains/widget/home/reported_events/widget/details_page/unsafe_act_details_page.dart';





class UnSafeActContainer extends StatelessWidget {
  UnSafeActContainer({super.key});

  UnSafeActController controller = Get.put(UnSafeActController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: controller.firestore.collection('unsafe_act').orderBy('time_sent').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }
        else if (snapshot.hasData) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h,);
            },
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs[index];
              //data['event']
              return InkWell(
                onTap: () {
                  Get.to(() => UnsafeActDetailsPage(
                    reporter: data['reporter'], 
                    eventLocation: data['event_location'], 
                    event: data['event'], 
                    eventDate: data['event_date'], 
                    eventTime: data['event_time'], 
                    eventPhoto: data['event_photo'], 
                    country: data['country'], 
                    plant: data['plant'], 
                  ));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h
                  ),
                  child: Container(
                    //height: 200.h,
                    //width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w, //18w
                      vertical: 20.h, //24.h
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0.1.r,
                          blurRadius: 8.0.r,
                        )
                      ],
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Icon(
                                Icons.assignment_rounded,
                                color: AppTheme.orangeColor,
                                size: 130.h,
                              )       
                            ),    
                            SizedBox(width: 10.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Reporter: ${data['reporter']}',
                                  style: TextStyle(
                                    color: AppTheme.darkGreyText,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(height: 5.h,),
                                Text(
                                  'Location: ${data['event_location']}',
                                  style: TextStyle(
                                    color: AppTheme.darkGreyText,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(height: 5.h,),
                                Text(
                                  'Plant: ${data['plant']}',
                                  style: TextStyle(
                                    color: AppTheme.darkGreyText,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(height: 5.h,),
                                Text(
                                  'Country: ${data['country']}',
                                  style: TextStyle(
                                    color: AppTheme.darkGreyText,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(height: 5.h,),
                                /*Text(
                                  "${controller.serverTimeStamp}", //server time stamp from firebase
                                  style: TextStyle(
                                    color: AppTheme.lightGreyText,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.normal
                                  ),
                                ),*/
                              ],
                            )
                          ],
                        ),
                      ]
                    ),
                  ),
                ),
              );
            }
          );
        }
        else if(snapshot.hasError) {
          debugPrint('${snapshot.error}');
          return Center(child: CircularProgressIndicator(strokeWidth: 3, color: Colors.red,),);
        }
        else {
          return SizedBox();
        }   
      }
    );
  }
}