import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';

import 'package:ecommerce/view/widget/cart/coustombottomnavgationBarCart.dart';
import 'package:ecommerce/view/widget/cart/customitemcart.dart';
import 'package:ecommerce/view/widget/cart/topcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {

  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: const Text("My Cart"),
       
      ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => BottomNavgationBarCart(
            shipping: "0",
            controllercoupon: controller.controllercoupon!,
            onApplyCoupon: () {
              cartController.checkcoupon();
            },
            price: "${cartController.priceorders}",
            discount: "${cartController.discountcoupon}",
            totalprice: "${cartController.getTotalPrice()}",
          ),
        ),
        body: GetBuilder<CartController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(children: [
                    
                    const SizedBox(
                      height: 10,
                    ),
                    TopCartCount(
                        title:
                            "You Have ${cartController.totalcountitems} Items In Your Cart"),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                              cartController.data.length,
                              (index) => CustomItemsCartList(
                                    onAdd: () async {
                                      await cartController.add(cartController
                                          .data[index].itemsId
                                          .toString());
                                      cartController.refreshPage();
                                    },
                                    onRemove: () async {
                                      await cartController.remove(cartController
                                          .data[index].itemsId
                                          .toString());
                                      cartController.refreshPage();
                                    },
                                    name:
                                        "${cartController.data[index].itemsName}",
                                    count:
                                        "${cartController.data[index].countitems}",
                                    price:
                                        "${cartController.data[index].itemsprice}",
                                    imagename:
                                        "${cartController.data[index].itemsImage}",
                                  ))
                        ],
                      ),
                    )
                  ]),
                )));
  }
}
