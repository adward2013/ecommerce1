import 'package:ecommerce/controller/forgetpassword/resetpassword_controller.dart';

import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




import '../../../../core/class/handlingdataview.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/coustomtextbodyauth.dart';
import '../../../widget/auth/coutombuttonauth.dart';
import '../../../widget/auth/customtextformauth.dart';



class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text("Reset Password",
              style: Theme.of(context)
                  .textTheme
                  // ignore: deprecated_member_use
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(builder: (controller) =>
    HandlingDataRequest(
    statusRequest: controller.statusRequest,
    widget:
            Container(

          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
          child:  Form(
            key: controller.formstate,
            child: ListView(
              children:  [

                CustomTextTitleAuth(text: "35".tr,),
                const SizedBox(
                  height: 10,
                ),
                CustomTextBodyAuth(text: "34".tr,),
                const SizedBox(
                  height: 15,
                ),


                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val){
                    return validInput(val!, 5, 30, "password");
                  },
                  mycontroller: controller.password ,

                  hinttext: "35".tr ,
                  labeltext: "19".tr,
                  iconData: Icons.lock_outline,
                  // mycontroller: ,
                ),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val){
                    return validInput(val!, 5, 30, "password");
                  },
                  mycontroller: controller.repassword ,

                  hinttext: "35".tr ,
                  labeltext: "20".tr,
                  iconData: Icons.lock_outline,
                  // mycontroller: ,
                ),

                CustomButtomAuth(
                  text: "33".tr,
                  onPressed: (){
                    controller.goToSuccessResetPassword();
                  },
                ),
                const SizedBox(height: 30,),


              ],
            ),
          ),
        ),)
    )
    );
  }
}
