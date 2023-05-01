import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .viewFavorite(myServices.sharedPreferences.getString("id")!);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];

        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(String favoriteid) {
    
    var response =  favoriteData.deleteFavorite(favoriteid);
    
        data.removeWhere((element) => element.favoriteId.toString() == favoriteid);
      
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
