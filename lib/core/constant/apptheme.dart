// ignore_for_file: deprecated_member_use

import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Color.fromRGBO(250, 250, 250, 1),
     centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.primaryColor),
        titleTextStyle: TextStyle(color: AppColor.primaryColor ,fontSize: 25, fontWeight: FontWeight.bold,fontFamily: "Cairo")
      
  ),
  floatingActionButtonTheme: const  FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor
  ),
fontFamily: "PlayfairDisplay",
textTheme: const TextTheme(
headline1 : TextStyle(
fontWeight: FontWeight.bold, fontSize: 22,color: AppColor.black),
headline2 : TextStyle(
fontWeight: FontWeight.bold, fontSize: 26,color: AppColor.black),
bodyText1:  TextStyle(
fontSize: 14,
height: 2,
color: AppColor.grey,
fontWeight: FontWeight.bold),
bodyText2:  TextStyle(
fontSize: 14,
height: 2,
color: AppColor.grey,
),
),
primarySwatch: Colors.blue,

);
ThemeData themeArabic = ThemeData(
   appBarTheme: const AppBarTheme(
    color: Color.fromRGBO(250, 250, 250, 1),
     centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.primaryColor),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor
  ),
fontFamily: "Cairo",
textTheme: const TextTheme(
headline1 : TextStyle(
fontWeight: FontWeight.bold, fontSize: 22,color: AppColor.black),
headline2 : TextStyle(
fontWeight: FontWeight.bold, fontSize: 26,color: AppColor.black),
bodyText1:  TextStyle(
fontSize: 14,
height: 2,
color: AppColor.grey,
fontWeight: FontWeight.bold),
bodyText2:  TextStyle(
fontSize: 14,
height: 2,
color: AppColor.grey,
),
),
primarySwatch: Colors.blue,

);