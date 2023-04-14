import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:olam_grains/constants/app_theme.dart';






class LoginController extends GetxController {


  //custom set state
  void setCountryState(Country _country) {
    country = _country;
    update();
  }

  bool showDummyText = true;
  bool isPlantSelected = false;
  Country? country; //save to firebase
  String dropDownValueForPlant = "Select Plant"; //save to firebase
  String dropDownValueForCountry = "Select Country"; //save to firebase
  final olamNigeriaPlantList = <String>[
    'Select Plant', 
    'TinCan A, Lagos', 
    'TinCan B, Lagos', 
    'Warri Port C, Warri', 
    'Dock Yard D, PortHarcourt', 
    "TinCan E, Lagos", 
    'TinCan F, Lagos',
    "Olam Abuja",     
  ];
  final olamSingaporePlantList = <String>[
    'Select Plant', 
    'Singapore A', 
    'Singapore B', 
    'Singapore C', 
    'Singapore D', 
    "Singapore E", 
    'Singapore F',
    "Olam HQ (Singapore)",     
  ];
  final olamPlantCountryList = <String>[
    'Select Country', 
    'Nigeria (NG)', 
    //'Singapore',   
  ];



  void showCountryDialog(BuildContext context) {
    return showCountryPicker(
      context: context,
      //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
      //exclude: <String>['KN', 'MF'],
      //favorite: <String>['NG'],
      //Optional. Shows phone code before the country name.
      showPhoneCode: false,
      onSelect: (Country _country) {
        setCountryState(_country);
        //debugPrint('Select country: ${_country.displayName}');
        debugPrint('Selected country: ${country!.displayName}');
      },
      // Optional. Sets the theme for the country list picker.
      countryListTheme: CountryListThemeData(
        // Optional. Sets the border radius for the bottomsheet.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0.r),
          topRight: Radius.circular(40.0.r),
        ),
        // Optional. Styles the search field.
        inputDecoration: InputDecoration(
          alignLabelWithHint: true,  
          //labelText: 'Search',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
          ),
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search, color: Colors.grey,),
          /*border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),*/
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppTheme.mainColor, 
              width: 2.0
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF8C98A8).withOpacity(0.2), 
              width: 2.0
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),             
        ),
        // Optional. Styles the text in the search field
        searchTextStyle: TextStyle(
          color: AppTheme.blackColor,
          fontSize: 16.sp,
        ),
      ),
    );
  }


}