import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/controllers/home/unsafe_act_controller.dart';
import 'package:olam_grains/styles/botton_styles.dart';
import 'package:olam_grains/util/appbar.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';





class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  //DateTime _selectedDate = DateTime.now();
  UnSafeActController controller = UnSafeActController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.backgroundColor,
      appBar: const CustomAppBar(title: 'Select Date'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            children: [
              SizedBox(height: 100.h,),
              Container(
                height: 100.h,
                alignment: Alignment.center,
                child: Text(
                  "${controller.selectedDate}",
                  style: TextStyle(
                    color: AppTheme.blackColor,
                    fontSize: 20.sp, 
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: 50.h,),
              SizedBox(
                height: 400.h, //250
                width: double.infinity,
                child: ScrollDatePicker(
                  scrollViewOptions: DatePickerScrollViewOptions(),
                  options: const DatePickerOptions(
                    itemExtent: 20,
                    isLoop: false,
                    perspective: 0.01,
                    //backgroundColor: AppTheme.whiteColor
                    backgroundColor: AppTheme.backgroundColor
                  ),
                  selectedDate: controller.selectedDate,
                  locale: const Locale('en'),
                  onDateTimeChanged: (DateTime value) {
                    setState(() {
                      controller.selectedDate = value;
                      controller.isDateSelected = true;
                    });
                    debugPrint("${controller.selectedDate}");
                    debugPrint("$value");
                    debugPrint("${controller.isDateSelected}");
                  },
                ),
              ),
              SizedBox(height: 60.h,),
              Container(
                //alignment: Alignment.bottomCenter,
                //padding: const EdgeInsets.only(right: 48),
                height: 70.h,
                width: double.infinity, //250.w
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 13.w
                ),
                decoration: BoxDecoration(
                  color: AppTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.1.r,
                      blurRadius: 8.0.r,
                    )
                  ],
                  border: Border.all(
                    color: AppTheme.mainColor,
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignInside
                  )
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      controller.selectedDate = DateTime.now();
                      controller.isDateSelected = true;
                    });
                    debugPrint("${controller.isDateSelected}");
                    debugPrint("${controller.selectedDate}");
                  },
                  child: Text(
                    "TODAY",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.mainColor
                    ),
                  ),
                ),
              ),
              /// Showcase second image source
              // SizedBox(
              //   height: 250,
              //   child: ScrollDatePicker(
              //     selectedDate: _selectedDate,
              //     locale: Locale('ko'),
              //     scrollViewOptions: DatePickerScrollViewOptions(
              //       year: ScrollViewDetailOptions(
              //         label: '년',
              //         margin: const EdgeInsets.only(right: 8),
              //       ),
              //       month: ScrollViewDetailOptions(
              //         label: '월',
              //         margin: const EdgeInsets.only(right: 8),
              //       ),
              //       day: ScrollViewDetailOptions(
              //         label: '일',
              //       )
              //     ),
              //     onDateTimeChanged: (DateTime value) {
              //       setState(() {
              //         _selectedDate = value;
              //       });
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
