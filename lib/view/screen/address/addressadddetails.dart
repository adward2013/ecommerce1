import 'package:ecommerce/controller/forgetpassword/address/addressdetails_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/cart/custombuttoncart.dart';
import 'package:ecommerce/view/widget/language/custombuttomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add details address'),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hinttext: "city",
                      labeltext: "city",
                      iconData: Icons.location_city,
                      mycontroller: controller.city,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "street",
                      labeltext: "street",
                      iconData: Icons.streetview,
                      mycontroller: controller.street,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "name",
                      labeltext: "name",
                      iconData: Icons.near_me,
                      mycontroller: controller.name,
                      valid: (val) {},
                      isNumber: false),
                  CustomButtomCart(
                    textbutton: "Add",
                    onPressed: () {
                      controller.addAddress() ; 
                    },
                  )
                ])),
          )),
    );
  }
}