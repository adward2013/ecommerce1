// ignore_for_file: unnecessary_overrides

import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/verifycode.dart';

import 'package:get/get.dart';

import '../../core/class/staturequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class VerifiyCodeController extends GetxController{
  goToResetPassword(String verifycode);
  checkCode();
}
class VerifiyCodeControllerImp extends VerifiyCodeController{

  String? email;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData = VerifyCodeForgetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postdata(email!, verifycode);

    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        Get.offNamed(AppRoute.resetPassword , arguments: {
          "email" : email
        });

      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
  @override
  checkCode() {


    Get.offNamed(AppRoute.resetPassword) ;
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