import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/auth/verifycodesignup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/auth/coustomtextbodyauth.dart';
import '../../widget/auth/coutombuttonauth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text("Verification Code",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: ListView(
                    children: [
                      const CustomTextTitleAuth(
                        text: "Check Code",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextBodyAuth(
                        text:
                            "Please Enter The Digit Code Sent To ${controller.email}",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      OtpTextField(
                        fieldWidth: 50,
                        borderRadius: BorderRadius.circular(20),

                        numberOfFields: 5,
                        borderColor: const Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.goToSuccessSigUp(verificationCode);
                        }, // end onSubmit
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButtomAuth(
                        text: "Rensend verfiy code",
                        onPressed: () {
                          //controller.reSend();
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ))));
  }
}
