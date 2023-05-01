import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../widget/auth/coustomtextbodyauth.dart';
import '../../widget/auth/coutombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsigup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text("9".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              const LogoAuth(),
                              CustomTextTitleAuth(
                                text: "10".tr,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextBodyAuth(
                                text: "11".tr,
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
                              GetBuilder<LoginControllerImp>(
                                  builder: (controller) => CustomTextFormAuth(
                                        isNumber: false,
                                        obscureText: controller.isshowpassword,
                                        onTapIcon: () {
                                          controller.showPassword();
                                        },
                                        valid: (val) {
                                          return validInput(
                                              val!, 5, 30, "password");
                                        },
                                        mycontroller: controller.password,
                                        hinttext: "13".tr,
                                        labeltext: "19".tr,
                                        iconData: Icons.lock_outline,
                                        // mycontroller: ,
                                      )),
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  "14".tr,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              CustomButtomAuth(
                                text: "15".tr,
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextSignUpOrSignIn(
                                textone: "16".tr,
                                texttwo: "17".tr,
                                onTap: () {
                                  controller.goToSignUp();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
