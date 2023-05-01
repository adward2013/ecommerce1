import 'package:ecommerce/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  chanePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: Text("Settings")),
      ],
    ),
    
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: Text("profile")),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: Text("Fav")),
      ],
    ),
  ];
  List titlebuttomappbar = [
    "home",
    "Settings",
   
    "profile",
    "favorite",
  ];
  @override
  // ignore: avoid_renaming_method_parameters
  chanePage(int i) {
    currentpage = i;
    update();
  }
}
