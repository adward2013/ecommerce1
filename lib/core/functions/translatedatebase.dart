import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

translateDatebase(columnar, columnen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
