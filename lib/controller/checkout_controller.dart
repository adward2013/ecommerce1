import 'dart:convert';

import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/datasource/remote/checkout.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  List<AddressModel> dataaddress = [];

  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? deliveryType;
  String? addressid;

  late String couponid;
  late String priceorders;

  choosePaymentMetod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  test() async {
    var data = {
      'userid': myServices.sharedPreferences.getString("id"),
      'addressid': addressid,
      'orderstype': deliveryType,
      'pricedelivery': 10.0,
      'ordersprice': priceorders,
      'couponid': couponid,
      'paymentmethod': paymentMethod,
    };

// Define the URL of the API endpoint
    var url =
        'http://adwar123-001-site1.gtempurl.com/ecommerce/orders/checkout.php';

// Send a POST request to the API endpoint
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));

// Parse theresponse from the API
    var responseData = jsonDecode(response.body);

// Check if the request was successful
    if (responseData['success']) {
      // Get the ID of the newly created order
      var orderId = responseData['order_id'];
      await Get.offNamed(AppRoute.homepage);

      // Do something with the order ID
      print('Order created successfully. ID: $orderId');
    } else {
      // Print the error message
      var errorMessage = responseData['message'];
      print('Error creating order: $errorMessage');
    }
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "userid": 419,
      "addressid": 116,
      "orderstype": 'standard',
      "pricedelivery": 110,
      "ordersprice": 121,
      "couponid": 10,
      // "paymentmethod": 1
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    getShippingAddress();

    super.onInit();
  }
}
