import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:olam_grains/constants/app_theme.dart';
import 'package:country_picker/country_picker.dart';
import 'package:olam_grains/controllers/login/login_controller.dart';
import 'package:olam_grains/screen/home_screen.dart';
import 'package:olam_grains/util/button.dart';
import 'package:olam_grains/util/loading_dialog_box.dart';





class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //GetX Statemanagement
  LoginController loginController = Get.put(LoginController());


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
          SizedBox(height: 50.h,),
          Center(
            child: Image.asset("assets/png/login_icon.png"),
          ),
          SizedBox(height: 90.0.h),

          //for selecting country
          /*InkWell(
            onTap: () {
              setState(() {
                showDummyText = false;
              });
              showCountryDialog(context);
            },
            child: Container(
              height: 87.h,
              //padding: EdgeInsets.all(15.h),
              //margin: EdgeInsets.only(bottom: 15.h),
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 26.w
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //if(country != null)
                  //SizedBox(width: 1.w,),
                  /*Icon(
                    CupertinoIcons.chevron_down,
                    color: AppTheme.mainColor,
                    //size: 30.0,
                  ),*/
                  //SizedBox(width: 10.w),
                  /*Expanded(
                    flex: 2,
                    child: Text(
                      showDummyText ? 'Select Country' : country!.displayNameNoCountryCode,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),*/
                  Text(
                    showDummyText ? 'Select Country' : country!.displayNameNoCountryCode,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.sp,
                    ),
                  ),
                  //SizedBox(height: 8.h),
                  Icon(
                    CupertinoIcons.chevron_down,
                    color: AppTheme.mainColor,
                    //size: 30.0,
                  ),
                ],
              ),
            ),
          ),*/
          Text(
            'Welcome to Safe Olam! Your safety is our utmost priority.',
            style: TextStyle(
              color: AppTheme.darkGreyText,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 20.h,),

          //for selecting COUNTRY,
          Container(
            //height: 70.h,
            //width: double.infinity,
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
            child: DropdownButtonFormField(
              iconSize: 20.h,
              icon: const Icon(
                CupertinoIcons.chevron_down,
                color: AppTheme.mainColor,
                size: 25,
              ),
              dropdownColor: AppTheme.whiteColor,
              value: loginController.dropDownValueForCountry,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                alignLabelWithHint: true,   
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppTheme.whiteColor, 
                    width: 2.0
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppTheme.whiteColor, 
                    width: 2.0
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                ),
                hintText: 'Country',
                hintStyle: TextStyle(color: AppTheme.lightGreyText, fontSize: 14.sp), //fontSize: 13   
                filled: true,
                fillColor: AppTheme.whiteColor,
              ),
              items: loginController.olamPlantCountryList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList(), 
              onChanged: (value) {
                setState(() {
                  loginController.dropDownValueForCountry = value;
                  loginController.isPlantSelected = !loginController.isPlantSelected;
                  //newly added logic to fix the glitching bug
                  loginController.isPlantSelected == false ? loginController.dropDownValueForCountry = 'Select Country' : loginController.dropDownValueForCountry = value;
                });
                debugPrint(loginController.dropDownValueForCountry); //this is what will be stored to database
              },
              //onTap: () {},
            )
          ),

          SizedBox(height: 30.h,),

          //for selecting PLANT,
          Container(
            //height: 70.h,
            //width: double.infinity,
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
            child: DropdownButtonFormField(
              iconSize: 20.h,
              icon: const Icon(
                CupertinoIcons.chevron_down,
                color: AppTheme.mainColor,
                size: 25,
              ),
              dropdownColor: AppTheme.whiteColor,
              value: loginController.dropDownValueForPlant,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                alignLabelWithHint: true,   
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppTheme.whiteColor, 
                    width: 2.0
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppTheme.whiteColor, 
                    width: 2.0
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                ),
                hintText: 'Plant',
                hintStyle: TextStyle(color: AppTheme.lightGreyText, fontSize: 14.sp), //fontSize: 13   
                filled: true,
                fillColor: AppTheme.whiteColor,
              ),
              items: 
              
              /********************** */
              loginController.dropDownValueForCountry == "Australia" ? 
              loginController.olamAustraliaPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              : loginController.dropDownValueForCountry == "Brazil" ? 
              loginController.olamBrazilPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Cameroon" ? 
              loginController.olamCameroonPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "China" ? 
              loginController.olamChinaPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Congo" ? 
              loginController.olamCongoPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Egypt" ? 
              loginController.olamEgyptPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Gabon" ? 
              loginController.olamGabonPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Germany" ? 
              loginController.olamGermanyPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Ghana" ? 
              loginController.olamGhanaPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Great Britain" ? 
              loginController.olamGreatBritainPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "India" ? 
              loginController.olamIndiaPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Indonesia" ? 
              loginController.olamIndonesiaPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Ivory Coast" ? 
              loginController.olamIvoryCoastPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Malaysia" ? 
              loginController.olamMalaysiaPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Mozambique" ? 
              loginController.olamMozambiquePlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Netherlands" ? 
              loginController.olamNetherlandsPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              : loginController.dropDownValueForCountry == "Nigeria" ? 
              loginController.olamNigeriaPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Senegal" ? 
              loginController.olamSenegalPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Singapore" ? 
              loginController.olamSingaporePlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Spain" ? 
              loginController.olamSpainPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Turkey" ? 
              loginController.olamTurkeyPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "US" ? 
              loginController.olamUSAPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :loginController.dropDownValueForCountry == "Vietnam" ? 
              loginController.olamVietnamPlantList
              .map<DropdownMenuItem>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      //fontWeight: FontWeight.w500
                    ),
                  )
                );
              }).toList()
              :null, ///the end
              /************************** keep using the tenary operator to specify for all the countries */


              onChanged: (value) {
                setState(() {
                  loginController.dropDownValueForPlant = value;
                  loginController.isPlantSelected = true;
                });
                debugPrint(loginController.dropDownValueForPlant); //this is what will be stored to database
                debugPrint("${loginController.isPlantSelected}");
              },
              //onTap: () {},
            )
          ),

          SizedBox(height: 60.h,),

          SizedBox(
            height: 80.h,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //disabledBackgroundColor:AppTheme.darkBlueButtonColor.withOpacity(0.6),
                backgroundColor: loginController.isPlantSelected ? AppTheme.mainColor : AppTheme.mainColor.withOpacity(0.4),
                minimumSize: Size.copy(Size(100.w, 50.h))
              ),
              onPressed: () {
                loginController.isPlantSelected ? showLoadingDialog(context).whenComplete(() => Get.offAll(() => HomeScreen())) : null;
              },
              child: Text(
                'Proceed',
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontSize: 18.sp
                ),
              ),
            ),
          )

        ]
      )
    );
  }
}