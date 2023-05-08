import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  int discountcoupon = 0;
  String? couponname;

  CouponModel? couponModel;

  TextEditingController? controllercoupon;

  late StatusRequest statusRequest;

  List<CartModel> data = [];

  int priceorders = 0;

  int totalcountitems = 0;

  add(String itemsid) async {
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

  remove(String itemsid) async {
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

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    viewCart();
    update();
  }

  viewCart() async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    // ignore: avoid_print
    print(
        "=============================== Controller---------------------------- ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = dataresponsecountprice['totalcount'];
          priceorders = dataresponsecountprice['totalprice'];
        } else {}
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkcoupon() async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllercoupon!.text);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = couponModel!.couponDiscound!;
        couponname = couponModel!.couponName;
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null ;
      }
    }
    update();
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon / 100);
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    viewCart();
    super.onInit();
  }
}
