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
  bool isCountryChanged = false;
  Country? country; //save to firebase
  String dropDownValueForPlant = "Select Plant"; //save to firebase
  String dropDownValueForCountry = "Select Country"; //save to firebase

  /////////for all plants in each country
  final olamAustraliaPlantList = <String>[
    'Select Plant',
    'Carwarp',
  ];

  final olamBrazilPlantList = <String>[
    'Select Plant',
    'Joanes Factory',
  ];

  final olamCameroonPlantList = <String>[
    'Select Plant',
    'Douala Flour',
  ];

  final olamChinaPlantList = <String>[
    'Select Plant',
    'Jinxiang',
  ];

  final olamCongoPlantList = <String>[
    'Select Plant',
    'CIB Pokola',
  ];

  final olamEgyptPlantList = <String>[
    'Select Plant',
    '6th October',
    'Beni Suef'
  ];

  final olamGabonPlantList = <String>[
    'Select Plant',
    'MOUILA',
    'AWALA',
    'EX-SIAT'
  ];

  final olamGermanyPlantList = <String>[
    'Select Plant',
    'Mannheim',
  ];

  final olamGhanaPlantList = <String>[
    'Select Plant',
    'Kumasi',
    'TEMA WHEAT',
    'Accra PFB Biscuits',
    'Accra PFB Tomato Paste'
  ];

  final olamGreatBritainPlantList = <String>[
    'Select Plant',
    'Goole',
  ];

  final olamIndiaPlantList = <String>[
    'Select Plant',
    'Spices Kochi',
  ];

  final olamIndonesiaPlantList = <String>[
    'Select Plant',
    'BT Cocoa',
  ];

  final olamIvoryCoastPlantList = <String>[
    'Select Plant',
    'San Pedro',
    'OCP - Abidjan'
  ];

  final olamMalaysiaPlantList = <String>[
    'Select Plant',
    'Johar',
  ];

  final olamMozambiquePlantList = <String>[
    'Select Plant',
    'BEIRA',
    'MAPUTO',
  ];

  final olamNetherlandsPlantList = <String>[
    'Select Plant',
    'KOOG',
    'WORMER'
  ];

  final olamNigeriaPlantList = <String>[
    'Select Plant', 
    'Sesame Sagamu Processing' ,
    'CFM Beachland',
    'OK SWEETS',
    'NG AFP Animal Feed Kaduna',
    'NG AFP Animal Feed Ilorin',
    'NG AFP Fish Feed Ilorin',
    'NG Rice Mill',
    'PHC Factory',
    'OK FOODS 1',
    'OK FOODS 2',
    'TINCAN A',
    'TINCAN B',
    'Ruyat Oil Limited',
    'Warri',
    'PFB NOODLE',
    'APAPA MFG',
    'IKORODU',
    'DFM KANO',
    'DFM ILORIN',
    'PFB Dry Packing',
    'DFM CALABAR',
    'Tomato Paste',
    'Ranona Beverages'
  ];

  final olamSenegalPlantList = <String>[
    'Select Plant',
    'Diamniadio Flour',
  ];

  final olamSingaporePlantList = <String>[
    'Select Plant', 
    'Cocoa Processing',    
  ];

  final olamSpainPlantList = <String>[
    'Select Plant',
    'Valencia',
    'Palencia',
    'SEDA Outspan - Villamuriel'
  ];

  final olamTurkeyPlantList = <String>[
    'Select Plant',
    'Piraziz Hazelnut',
  ];

  final olamUSAPlantList = <String>[
    'Select Plant',
    'Blakely',
    'Dublin',
    'Edenton',
    'Gilroy',
    'FIREBAUGH',
    'FERNLEY',
    'SMITHVILLE',
    'Las Cruses',
    'HNI Livingston',
    'HNI Leedom',
    'HNI Verduga',
    'Samson',
    'New Rochelle',
    'Sylvester'
  ];

  final olamVietnamPlantList = <String>[
    'Select Plant',
    'LOTECO',
    'DUCATI',
    'Olam Cafe Outspan',
    'Bien Hoa',
    'Tien Nga',
    'Giang Dien',
    'CPC-Vietnam',
  ];


  ////////////////for all olam plants world wide
  final olamPlantCountryList = <String>[
    'Select Country',
    'Australia',
    'Brazil',
    'Cameroon',
    'China',
    'Congo',
    'Egypt',
    'Gabon',
    'Germany',
    'Ghana',
    'Great Britain',
    'India',
    'Indonesia',
    'Ivory Coast',
    'Malaysia',
    'Mozambique',
    'Netherlands',
    'Nigeria',
    'Senegal',
    'Singapore',
    'Spain',
    'Turkey',
    'US',
    'Vietnam',
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