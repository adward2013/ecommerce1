import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imgeasset.dart';
import 'package:ecommerce/view/widget/checkout/carddeliveerytype.dart';
import 'package:ecommerce/view/widget/checkout/cardshippingaddress.dart';
import 'package:ecommerce/view/widget/checkout/cartpaymentmathod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Check out"),
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: MaterialButton(
              onPressed: () {},
              textColor: AppColor.white,
              color: AppColor.secoundColor,
              child: const Text(
                "Checkout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )),
        body: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        const Text(
                          "Choose Paymet Method",
                          style: TextStyle(
                              color: AppColor.secoundColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMetod("cash");
                          },
                          child: CardPaymentMethodCheckout(
                            title: "Cash On Delivery",
                            isActive: controller.paymentMethod == "cash"
                                ? true
                                : false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMetod("card");
                          },
                          child: CardPaymentMethodCheckout(
                            title: "Payment Cards",
                            isActive: controller.paymentMethod == "card"
                                ? true
                                : false,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Choose Delivery Type",
                          style: TextStyle(
                              color: AppColor.secoundColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryType("delivery");
                              },
                              child: CardDeliveryTypeCheckout(
                                active: controller.deliveryType == "delivery"
                                ? true
                                : false,
                                imagename: AppImageAsset.delivery,
                                title: 'Delivery',
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                 controller.chooseDeliveryType("recive");
                              },
                              child: CardDeliveryTypeCheckout(
                                active: controller.deliveryType == "recive"
                                ? true
                                : false,
                                imagename: AppImageAsset.drivethru,
                                title: 'Recive',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         if(controller.deliveryType == "delivery")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const[
                           Text(
                          "Shipping  Address",
                          style: TextStyle(
                              color: AppColor.secoundColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                         SizedBox(
                          height: 10,
                        ),
                        
                         CardShppingAddressCheckout(
                          title: "Home",
                          isactive: true,
                          body: "EdwardStreet",
                        ),
                         CardShppingAddressCheckout(
                          title: "Company",
                          isactive: false,
                          body: "9Street",
                        ) 
                        // ],): Container(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10),
                        //   child: CardShppingAddressCheckout(isactive: true,
                        //   title: "total price",
                        //   body: "600 \$",
                          //),
                      ])
                      ],
                    ),
                  ),
                )));
  }
}
