import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  List data = [];

  add(String itemsid) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
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

  remove(String itemsid) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "notification", messageText: Text("Done Removed"));
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // update();
  }

  getCountItems(String itemsid) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        //countitems = int.parse( response['data']);
        countitems = response['data'];
        print(
            "----------------------------- $countitems ---------------------");
        //data.addAll(response['data']);
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
