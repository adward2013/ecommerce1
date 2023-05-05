import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/view/widget/cart/appbarcart.dart';
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
      bottomNavigationBar:  BottomNavgationBarCart(
        price: "${cartController.priceorders}",
        shipping: "200",
        totalprice: "1400",
      ),
      body: GetBuilder<CartController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget:  ListView(children: [
        const TopAppBarCart(title: "My Cart"),
        const SizedBox(
          height: 10,
        ),
         TopCartCount(title: "You Have ${cartController.totalcountitems} Items In Your Cart"),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children:  [
              ...List.generate(cartController.data.length, (index) => CustomItemsCartList(
                name: "${cartController.data[index].itemsName}",
                count: "${cartController.data[index].countitems}",
                price: "${cartController.data[index].itemsprice}",
                imagename: "${cartController.data[index].itemsImage}",
              ))
             
            ],
          ),
        )
      ]),)
    ));
  }
}
