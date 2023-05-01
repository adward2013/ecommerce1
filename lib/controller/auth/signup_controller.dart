import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/staturequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToSigIn();
}
class SignUpControllerImp extends SignUpController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());

  List data = [];

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(username.text,password.text,email.text,phone.text);
      // ignore: avoid_print
      print("=============================== Controller $response ") ;
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if(response['status'] == "success"){
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiycodeSignUp , arguments: {
            "email" : email.text
          });
        }else {
          Get.defaultDialog(title: "Warning" , middleText: "Verify Code Not Correct");
          statusRequest = StatusRequest.failure ;
        }

      }
      update();

      // Get.delete<SignUpControllerImp>();
    } else {
      // ignore: avoid_print
      print("Not Valid");
    }
  }
  @override
  goToSigIn() {
    Get.offNamed(AppRoute.login) ;
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }


  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();

    super.dispose();
  }


}