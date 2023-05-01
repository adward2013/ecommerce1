// ignore_for_file: unnecessary_overrides

import 'package:ecommerce/core/constant/routes.dart';

import 'package:get/get.dart';

import '../../core/class/staturequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/verfiycodesigup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();

  goToSuccessSigUp(String verfiyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {

  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());



  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {

  }

  @override
  goToSuccessSigUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.postdata(email!, verfiyCodeSignUp);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        Get.offNamed(AppRoute.successSignUp);

    } else {
      Get.defaultDialog(
          title: "Warning", middleText: "Verify Code Not Correct");
      statusRequest = StatusRequest.failure;
    }
  }

  update();

}

@override
void onInit() {
  email = Get.arguments['email'];


  super.onInit();
}



@override
void dispose() {
  super.dispose();
}


}