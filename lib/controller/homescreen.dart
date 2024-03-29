import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/offers.dart';

import 'package:ecommerce/view/screen/recommendation.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  chanePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
  const HomePage(),
  const RecommendationView(),
  const OffersView(),
  const Settings()
  ];
  List buttomappbar = [
    {"title": "home", "icon": Icons.home_outlined},
    {"title": "notifications", "icon": Icons.recommend_outlined},
    {"title": "offers", "icon": Icons.discount_outlined},
    {"title": "settings", "icon": Icons.settings_outlined}
  ];
  @override
  // ignore: avoid_renaming_method_parameters
  chanePage(int i) {
    currentpage = i;
    update();
  }
}
