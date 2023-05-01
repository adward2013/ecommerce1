import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/login.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/staturequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}
class LoginControllerImp extends LoginController{
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();


 late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;


  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;


  showPassword(){
    isshowpassword = isshowpassword == true ? false : true ;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate())  {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text ,password.text);
      // ignore: avoid_print
      print("=============================== Controller $response ") ;
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if(response['status'] == "success"){
          // data.addAll(response['data']);
          //
          myServices.sharedPreferences.setString("id", response['data']['users_id'].toString());
          myServices.sharedPreferences.setString("username", response['data']['users_name']);
          myServices.sharedPreferences.setString("email", response['data']['users_email']);
          myServices.sharedPreferences.setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoute.homepage );
        }else {
          Get.defaultDialog(title: "Warning" , middleText: "Email Or Password Not Correct");
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
  goToSignUp() {
    Get.offNamed(AppRoute.signUp) ;
  }

  @override
  void onInit() {

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }


  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  goToForgetPassword() {

    Get.toNamed(AppRoute.forgetPassword) ;

  }


}