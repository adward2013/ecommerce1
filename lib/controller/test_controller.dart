
// import 'package:ecommerce/core/class/staturequest.dart';
// import 'package:ecommerce/data/datasource/remote/test_data.dart';
// import 'package:get/get.dart';
//
// import '../core/functions/handlingdatacontroller.dart';
//
// class TestController extends GetxController {
//   TestData testData = TestData(Get.find());
//
//   List data = [];
//
//   late StatusRequest statusRequest;
//
//   getData() async {
//     statusRequest = StatusRequest.loading;
//     var response = await testData.getData();
//     print("=============================== Controller $response ") ;
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       data.addAll(response['data']);
//     }
//     update();
//   }
//
//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }
// }
import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdatacontroller.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    // ignore: avoid_print
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == "success"){
        data.addAll(response['data']);
      }else {
        statusRequest = StatusRequest.failure ;
      }

    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
