import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/forgatpassword_controller.dart';

import '../../../../core/class/handlingdataview.dart';

import '../../../../core/functions/alertexitapp.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/coustomtextbodyauth.dart';
import '../../../widget/auth/coutombuttonauth.dart';
import '../../../widget/auth/customtextformauth.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text("14".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: WillPopScope(
    onWillPop: alertExitApp,
    child:GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) =>
          HandlingDataRequest(
          statusRequest: controller.statusRequest,
    widget:
              Container(

            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  CustomTextTitleAuth(
                    text: "27".tr,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextBodyAuth(
                    text: "29".tr,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    mycontroller: controller.email,

                    hinttext: "12".tr,
                    labeltext: "18".tr,
                    iconData: Icons.email_outlined,
                    // mycontroller: ,
                  ),
                  CustomButtomAuth(
                    text: "30".tr,
                    onPressed: () {
                      controller.checkemail();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),)
        )
        ));
  }
}
