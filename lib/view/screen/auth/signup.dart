import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/coustomtextbodyauth.dart';
import '../../widget/auth/coutombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/textsigup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp() , fenix: true);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text("17".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
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
                                return validInput(val!, 5, 50, "username");
                              },
                              mycontroller: controller.username,
                              hinttext: "23".tr,
                              labeltext: "20".tr,
                              iconData: Icons.person_outline,
                              // mycontroller: ,
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
                            CustomTextFormAuth(
                              isNumber: true,
                              valid: (val) {
                                return validInput(val!, 5, 30, "phone");
                              },
                              mycontroller: controller.phone,
                              hinttext: "22".tr,
                              labeltext: "21".tr,
                              iconData: Icons.phone_android_outlined,
                              // mycontroller: ,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 30, "password");
                              },
                              mycontroller: controller.password,
                              hinttext: "13".tr,
                              labeltext: "19".tr,
                              iconData: Icons.lock_outline,
                              // mycontroller: ,
                            ),

                            // const Text("Forget Password", textAlign: TextAlign.end,),
                            CustomButtomAuth(
                              text: "17".tr,
                              onPressed: () {
                                controller.signUp();
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            CustomTextSignUpOrSignIn(
                              textone: "25".tr,
                              texttwo: "9".tr,
                              onTap: () {
                                controller.goToSigIn();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
        ));
  }
}
