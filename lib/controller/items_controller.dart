import 'dart:convert';

import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

abstract class ItemsController extends GetxController {
  inialData();
  changeCat(int? val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  int? selectedCat;

  ItemsData itemsData = ItemsData(Get.find());

  List data = [];
  String? catid;

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    inialData();
    super.onInit();
  }

  inialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  submitRating(String itemid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.rating(
        myServices.sharedPreferences.getString("id").toString(),
        itemid,
        comment,
        rating.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        print("----------------------------------success------------------");
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  test(String itemid, double rating, String comment) async {
    final url = 'http://adwar123-001-site1.gtempurl.com/ecommerce/test3.php';
    final response = await http.post(Uri.parse(url), body: {
      'userid': myServices.sharedPreferences.getString("id"),
      'itemid': itemid,
      'rating': rating.toString(),
      'comment': comment,
    });
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
