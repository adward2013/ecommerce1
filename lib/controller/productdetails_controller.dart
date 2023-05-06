import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());

  late ItemsModel itemsModel;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  int countitems = 0;



additems(String itemsid) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();
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
    update();
  }

  removeitems(String itemsid) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id")!, itemsid.toString());
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
    update();
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
    update();
  }

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems =
        await getCountItems(itemsModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  List subitems = [
    {
      "name": "red",
      "id": 1,
      "active": "1",
    },
    {
      "name": "blue",
      "id": 2,
      "active": "0",
    },
    {"name": "black", "id": 3, "active": "1"}
  ];

  add() {
    additems(itemsModel.itemsId.toString());
    countitems++;
     update();
  }

  remove() {
    if (countitems > 0) {
      removeitems(itemsModel.itemsId.toString());
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();

    super.onInit();
  }
}
