

import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/services/services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController{

  ThemeData appTheme  = themeEnglish ;

  // ignore: non_constant_identifier_names
  Locale? Language;

  MyServices myServices = Get.find();

  changeLang(String langcode){
    Locale locale = Locale(langcode) ;
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic :themeEnglish ;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }
   @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang == "ar"){
      Language = const Locale("ar");
      appTheme = themeArabic;
    }else if(sharedPrefLang == "en"){
      Language = const Locale("en");
      appTheme = themeEnglish;
    }else{
      Language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}