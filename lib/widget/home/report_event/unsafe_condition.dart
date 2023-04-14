import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/controllers/home/unsafe_condition_controller.dart';
import 'package:olam_grains/util/appbar.dart';






class UnSafeCondition extends StatefulWidget {
  UnSafeCondition({super.key});

  @override
  State<UnSafeCondition> createState() => _UnSafeConditionState();
}

class _UnSafeConditionState extends State<UnSafeCondition> {

  final UnSafeConditionController controller = Get.put(UnSafeConditionController());

  //for date 
  void onDateChanged(DateTime date) {
    setState(() {
      controller.selectedDate = date;
      controller.isDateSelected = true;
      debugPrint("${controller.selectedDate}");
    });
  }

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
          
          ////////////////////////// Cupertino is simply the best 😎
          Text(
            'When did it happen?',
            style: TextStyle(
              color: AppTheme.lightGreyText,
              fontSize: 14.sp,
            )
          ),
          SizedBox(height: 10.h,),
          CupertinoDateTextBox(
            initialValue: controller.selectedDate,
            onDateChange: onDateChanged,
            hintText: controller.isDateSelected 
            ? DateFormat.yMd().format(controller.selectedDate) 
            : 'When did it happen?',
            hintColor: AppTheme.lightGreyText,
            
          ),
          
          //////////////////

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