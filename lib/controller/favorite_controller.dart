import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  //key => id
  //value => 1, 0 favorite Column favorite sql
  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }
  //isfavorite ={
  //  2 : 1 , 1 : 3
  //};

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "notification", messageText: Text("Done added"));
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // update();
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "notification", messageText: Text("Done removed"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // update();
  }

  goToFavorite() {
    Get.offNamed(AppRoute.myfavorite);
  }
}
