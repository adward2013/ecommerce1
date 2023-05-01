import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/successresetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/coutombuttonauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text("32".tr,
            style: Theme.of(context)
                .textTheme
                // ignore: deprecated_member_use
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: (Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Center(
              child:  Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
             Text("36".tr),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                text: "31".tr,
                onPressed: () {
                    controller.goToPageLogin();
                },
              ),

            ),
            const SizedBox(height: 30,)
          ],
        ),
      )),
    );
  }
}
