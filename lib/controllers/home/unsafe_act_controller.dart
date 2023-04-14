import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:olam_grains/controllers/login/login_controller.dart';
import 'package:olam_grains/styles/botton_styles.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:olam_grains/util/loading_dialog_box.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';






class UnSafeActController extends GetxController {

  final LoginController loginController = Get.put(LoginController());

  //flutter holo date picker plugin
  Future<void> showDatePickerDialogue(BuildContext context) async{
    var datePicked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2090),
      dateFormat: "dd-MMMM-yyyy",
      locale: DateTimePickerLocale.en_us,
      looping: true,
      titleText: 'Select Date',
      confirmText: 'Ok',
      cancelText: 'Cancel',
      //itemTextStyle: TextStyle(
        //color: AppTheme.mainColor
      //)
      //textColor: AppTheme.mainColor
    );
    debugPrint("$datePicked");
    //Get.snackbar('Picked!', "$datePicked", duration: const Duration(seconds: 2), isDismissible: false, colorText: Colors.black, borderRadius: 10, backgroundColor: AppTheme.whiteColor, snackPosition: SnackPosition.BOTTOM, dismissDirection: DismissDirection.down);
  }




  TextEditingController nameController = TextEditingController();
  TextEditingController reportController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  late TextEditingController timeController;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final DateFormat formatter = DateFormat('HH:mm');
  bool isSelectedFromCamera = false;
  bool isImageEmpty = true;
  bool isTimeControllerSelected = false;
  var uuid = const Uuid();
  
  //for cupertino date picker
  bool isDateSelected = false;
  DateTime selectedDate = DateTime.now(); //for date picker plugin

  //user inputted date of event
  DateTime serverTimeStamp = DateTime.now();


  @override
  void onInit() {
    timeController = TextEditingController();
    timeController.addListener(() {
      final textChecker = timeController.text.isNotEmpty;
      //void setState() {}
      isTimeControllerSelected = textChecker;
    });
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    reportController.dispose();
    locationController.dispose();
    dateController.dispose();
    timeController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  
  /*****Imgae Picker Family*****/
  Future<File?> pickImageFromGallery() async{
    File? image;
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickedImage != null) {
        image = File(pickedImage.path);
        isImageEmpty = false;
      }
      else {
        debugPrint('Uh-Oh! No image was selected from gallery');
        isImageEmpty = true;
      }
    }
    catch (e) {
      Get.snackbar('Error!', "$e", duration: const Duration(seconds: 2), isDismissible: false, colorText: Colors.black, borderRadius: 10, backgroundColor: AppTheme.whiteColor, snackPosition: SnackPosition.BOTTOM, dismissDirection: DismissDirection.down);
    }
    update();
    return image;
  }

  Future<File?> pickImageFromCamera() async{
    File? image;
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
      if(pickedImage != null) {
        image = File(pickedImage.path);
        isImageEmpty = false;
      }
      else {
        debugPrint('Uh-Oh! No image was taken with device camera');
        isImageEmpty = true;
      }
    }
    catch (e) {
      Get.snackbar('Error!', "$e", duration: const Duration(seconds: 2), isDismissible: false, colorText: Colors.black, borderRadius: 10, backgroundColor: AppTheme.whiteColor, snackPosition: SnackPosition.BOTTOM, dismissDirection: DismissDirection.down);
    }
    update();
    return image;
  }

  //works for android and iOS only

  //#1
  File? image;  
  Future<void> selectImageFromGallery() async{
    image = await pickImageFromGallery();
    isSelectedFromCamera = false;
    update();
  }

  //#2
  File? image2;  
  Future<void> selectImageFromCamera() async{
    image2 = await pickImageFromCamera();
    isSelectedFromCamera = true;
    update();
  }
  
  //saves image selected to firebase
  Future<void> saveSelectedImageToFirebase() async{
    if(isSelectedFromCamera) {
      if(image2 == null) {
        debugPrint("no image found");
        isImageEmpty = true;
      }
      else {
        final fileName = File(image2!.path);
        final destination = 'unsafe_act_files/$fileName';
        try {
          final ref = firebaseStorage.ref(destination).child('file/');
          await ref.putFile(image2!);
          isImageEmpty = false;

          final downloadUrl = await ref.getDownloadURL();
          debugPrint(downloadUrl);
          //upload saved image to cloud firstore since we have gotten the download URL
          firestore.collection('unsafe_act').doc("${nameController.text}_${timeController.text}").set({ //set
            'event_photo': downloadUrl
          });
        }
        catch (e) {
          Get.snackbar('Error!', "$e", duration: const Duration(seconds: 2), isDismissible: false, colorText: Colors.black, borderRadius: 10, backgroundColor: AppTheme.whiteColor, snackPosition: SnackPosition.BOTTOM, dismissDirection: DismissDirection.down);
        }
      }
    }
    else{
      if(image == null) {
        debugPrint("no image found");
        isImageEmpty = true;
      }
      else {
        final fileName = File(image!.path);
        final destination = 'unsafe_act_files/$fileName';
        try {
          final ref = firebaseStorage.ref(destination).child('file/');
          await ref.putFile(image!);
          isImageEmpty = false;

          final downloadUrl = await ref.getDownloadURL();
          debugPrint(downloadUrl);
          //upload saved image to cloud firstore since we have gotten the download URL
          //for(int i = 0; i<= 100; i++) {}
          firestore.collection('unsafe_act').doc("${nameController.text}_${timeController.text}").set({  //set
            'event_photo': downloadUrl
          });
        }
        catch (e) {
          Get.snackbar('Error!', "$e", duration: const Duration(seconds: 2), isDismissible: false, colorText: Colors.black, borderRadius: 10, backgroundColor: AppTheme.whiteColor, snackPosition: SnackPosition.BOTTOM, dismissDirection: DismissDirection.down);
        }
      }
    }
  }

  

  Future<void> saveDetailsToFirebase(BuildContext context) async{
    try {
      if(isImageEmpty == true || nameController.text.isEmpty || reportController.text.isEmpty || locationController.text.isEmpty || timeController.text.isEmpty) {
        Get.snackbar('Error', "kindly fill in required information", duration: const Duration(seconds: 2), isDismissible: false, colorText: Colors.black, borderRadius: 10, backgroundColor: AppTheme.whiteColor, snackPosition: SnackPosition.BOTTOM, dismissDirection: DismissDirection.down);
      }
      else {
        await firestore.collection('unsafe_act').doc("${nameController.text}_${timeController.text}")
        .update({
          'reporter': nameController.text,
          'event': reportController.text,
          'event_location': locationController.text,
          'country': loginController.dropDownValueForCountry,
          'plant': loginController.dropDownValueForPlant,
          'event_date': "$selectedDate",
          'event_time': timeController.text,
          'time_sent': serverTimeStamp
        })
        .whenComplete(() => showLoadingDialog(context).whenComplete(() => Get.snackbar('Success!', "your report has been submitted", duration: const Duration(seconds: 2), isDismissible: false, colorText: Colors.black, borderRadius: 10, backgroundColor: AppTheme.whiteColor, snackPosition: SnackPosition.BOTTOM, dismissDirection: DismissDirection.down)));
        //.whenComplete(() => saveSelectedImageToFirebase().whenComplete(() => showLoadingDialog(context).whenComplete(() => Get.snackbar('Success!', "your report has been submitted", duration: Duration(seconds: 2), isDismissible: false, colorText: Colors.black, borderRadius: 10, backgroundColor: AppTheme.whiteColor, snackPosition: SnackPosition.BOTTOM, dismissDirection: DismissDirection.down))));
      }
    }
    catch (e) {
      Get.snackbar('Error!', "$e", duration: const Duration(seconds: 2), isDismissible: false, colorText: Colors.black, borderRadius: 10, backgroundColor: AppTheme.whiteColor, snackPosition: SnackPosition.BOTTOM, dismissDirection: DismissDirection.down);
    }
  }

  Future<void> takePhotoBottomSheet({required BuildContext context}) async {
  showModalBottomSheet(
    isScrollControlled: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 2,
    isDismissible: false,
    useSafeArea: true,
    backgroundColor: AppTheme.backgroundColor,
    //barrierColor: Theme.of(context).colorScheme.background,
    shape: const RoundedRectangleBorder(
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
                          selectImageFromCamera();
                        }, 
                        child: Text(
                          'Take Photo',
                          style: TextStyle(
                            color: AppTheme.mainColor,
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
                          selectImageFromGallery();
                        }, 
                        child: Text(
                          'Select Photo From Gallery',
                          style: TextStyle(
                            color: AppTheme.mainColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ),
                    ),
                    /*SizedBox(
                      width: double.infinity,
                      child: Divider(
                        thickness: 1,
                        color: AppTheme.darkGreyText.withOpacity(0.2),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          
                        }, 
                        child: Text(
                          'Delete Photo',
                          style: TextStyle(
                            color: AppTheme.mainColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ),
                    ),*/
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
                        backgroundColor: AppTheme.mainColor,
                        minimumSize: Size.copy(
                          Size(100.w, 55.h),
                        ),
                        maximumSize: Size.copy(
                          Size(100.w, 55.h),
                        ),
                      ),
                      onPressed: () {
                        //Get.back();
                        saveSelectedImageToFirebase().whenComplete(() => Get.back());
                      },
                      child: Text(
                        'Done',
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

  
}