import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  deleteAddress(String addressid) {
    
    addressData.deleteData(addressid);
    // ignore: unrelated_type_equality_checks
    data.removeWhere((element) => element.addressId == addressid);
    
    update();

  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
   // ignore: avoid_print
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty){
          statusRequest = StatusRequest.failure ; 
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}