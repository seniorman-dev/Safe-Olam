import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/controllers/home/unsafe_condition_controller.dart';
import 'package:olam_grains/util/appbar.dart';
import 'package:olam_grains/widget/home/report_event/custom_date_picker/date_picker_2.dart';





class UnSafeCondition extends StatelessWidget {
  UnSafeCondition({super.key});

  final UnSafeConditionController controller = Get.put(UnSafeConditionController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.backgroundColor,
        appBar: CustomAppBar(title: 'Unsafe Condition',),
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

          SizedBox(height: 100.h,),
          Text(
            'Please ensure information provided are honest and accurate.',
            style: TextStyle(
              color: AppTheme.lightGreyText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 20.h,),
          //name text form field
          TextFormField(
            onSaved: (value) {      
              controller.nameController.text = value!;
            },
            scrollPhysics: BouncingScrollPhysics(),
            controller: controller.nameController,
            keyboardType: TextInputType.name,
            autocorrect: true,
            inputFormatters: [],
            enableSuggestions: true,
            enableInteractiveSelection: true,
            cursorColor: AppTheme.blackColor,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              //contentPadding: fieldContentPadding,
              hintText: 'Full name e.g John Doe',
              alignLabelWithHint: true,
              hintStyle: TextStyle(
                color: AppTheme.lightGreyText
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.lightGreyText.withOpacity(0.3), width: 1.0),
                borderRadius: BorderRadius.circular(5)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.mainColor, width: 1.0),
                borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          //report text form field
          TextFormField(
            onSaved: (value) {      
              controller.reportController.text = value!;
            },
            scrollPhysics: BouncingScrollPhysics(),
            controller: controller.reportController,
            keyboardType: TextInputType.text,
            autocorrect: true,
            inputFormatters: [],
            enableSuggestions: true,
            enableInteractiveSelection: true,
            cursorColor: AppTheme.blackColor,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              //contentPadding: fieldContentPadding,
              hintText: 'What happened?',
              alignLabelWithHint: true,
              hintStyle: TextStyle(
                color: AppTheme.lightGreyText
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.lightGreyText.withOpacity(0.3), width: 1.0),
                borderRadius: BorderRadius.circular(5)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.mainColor, width: 1.0),
                borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          //location text form field
          TextFormField(
            onSaved: (value) {      
              controller.locationController.text = value!;
            },
            scrollPhysics: BouncingScrollPhysics(),
            controller: controller.locationController,
            keyboardType: TextInputType.text,
            autocorrect: true,
            inputFormatters: [],
            enableSuggestions: true,
            enableInteractiveSelection: true,
            cursorColor: AppTheme.blackColor,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              //contentPadding: fieldContentPadding,
              hintText: 'Where did it happen?',
              alignLabelWithHint: true,
              hintStyle: TextStyle(
                color: AppTheme.lightGreyText
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.lightGreyText.withOpacity(0.3), width: 1.0),
                borderRadius: BorderRadius.circular(5)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.mainColor, width: 1.0),
                borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          
          //date text form field
          /*TextFormField(
            onSaved: (value) {      
              controller.dateController.text = value!;
            },
            controller: controller.dateController,
            keyboardType: TextInputType.datetime,
            autocorrect: true,
            inputFormatters: [],
            enableSuggestions: true,
            enableInteractiveSelection: true,
            cursorColor: AppTheme.blackColor,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              //contentPadding: fieldContentPadding,
              hintText: 'Date (dd/mm/yyyy)',
              alignLabelWithHint: true,
              hintStyle: TextStyle(
                color: AppTheme.lightGreyText
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.lightGreyText.withOpacity(0.3), width: 1.0),
                borderRadius: BorderRadius.circular(5)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.mainColor, width: 1.0),
                borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),*/

          InkWell(
            onTap: () {
              Get.to(() => CustomDatePicker2());
              debugPrint("${controller.selectedDate}");
              debugPrint("${controller.isDateSelected}");
            },
            child: Container(
              height: 70.h,
              width: double.infinity,
              //padding: EdgeInsets.all(15.h),
              //margin: EdgeInsets.only(bottom: 15.h),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.isDateSelected ? "${controller.selectedDate}" : 'Select Date',
                    style: TextStyle(
                      color: AppTheme.lightGreyText,
                      fontSize: 14.sp,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    color: AppTheme.blackColor,
                    size: 25,
                  ),
                ],
              )
            ),
          ),

          SizedBox(height: 20.h,),
          //time text form field
          TextFormField(
            onSaved: (value) {      
              controller.timeController.text = value!;
            },
            scrollPhysics: BouncingScrollPhysics(),
            controller: controller.timeController,
            keyboardType: TextInputType.datetime,
            autocorrect: true,
            inputFormatters: [],
            enableSuggestions: true,
            enableInteractiveSelection: true,
            cursorColor: AppTheme.blackColor,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              //contentPadding: fieldContentPadding,
              hintText: 'Time (hh:mm PM)',
              alignLabelWithHint: true,
              hintStyle: TextStyle(
                color: AppTheme.lightGreyText
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.lightGreyText.withOpacity(0.3), width: 1.0),
                borderRadius: BorderRadius.circular(5)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.mainColor, width: 1.0),
                borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Center(
            child: TextButton(
              onPressed: () {
                //bottom sheet
                controller.takePhotoBottomSheet(context: context);
              },
              child: Text(
                'Upload Photo',
                style: TextStyle(
                  color: AppTheme.mainColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),


          /*SizedBox(height: 20.h,),                                CustomDatePicker2
          
          
          //row that contains 3 contaners to display images stored in firebase (will re-use this for details screen)
          Center(
            child: Container(
              height: 150.h,
              width: 150.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: controller.isImageEmpty ? Colors.grey : null,
                border: Border.all(
                  color: AppTheme.mainColor
                )
                /*boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0.1.r,
                    blurRadius: 8.0.r,
                  )
                ],*/
              ),
              child: controller.isImageEmpty 
              ?Text(
                'O',
                style: TextStyle(
                  color: AppTheme.blackColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold
                ),
              )
              : 
              Image.file(
                controller.isSelectedFromCamera ? controller.image2! : controller.image!,
                fit: BoxFit.fill,
              )
            ),
          ),*/

          SizedBox(height: 40.h,),

          SizedBox(
            height: 70.h, //65.h
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //disabledBackgroundColor:AppTheme.darkBlueButtonColor.withOpacity(0.6),
                backgroundColor: AppTheme.mainColor,
                minimumSize: Size.copy(Size(100.w, 50.h))
              ),
              onPressed: () {
                controller.saveDetails(context);
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontSize: 18.sp
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h,),

        ]
      )
    );
  }
}