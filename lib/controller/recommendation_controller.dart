import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';

import 'package:ecommerce/data/datasource/remote/recommendation_data.dart';

import 'package:ecommerce/data/model/recommendationmodel.dart';
import 'package:get/get.dart';

class RecommendationController extends GetxController {
  RecommendationData recommendationData = RecommendationData(Get.find());

  

  List<RecommendationModel> data = [];
  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await recommendationData.getData(myServices.sharedPreferences.getString("id")!);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => RecommendationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
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
