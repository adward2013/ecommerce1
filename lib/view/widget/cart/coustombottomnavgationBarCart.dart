import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/cart/custombuttoncart.dart';
import 'package:ecommerce/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String? price;
  final String? discount;
  final String? shipping;
  final String? totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;

  const BottomNavgationBarCart(
      {super.key,
      this.price,
      this.discount,
      this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon,
      this.shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 9, horizontal: 10),
                              hintText: "Coupon Code",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomButtomCoupon(
                              textbutton: 'Apply',
                              onPressed: onApplyCoupon,
                            ))
                      ],
                    ),
                  )
                : Text(
                    "Coupon Code ${controller.couponname!}",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )),
        Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "price",
                          style: TextStyle(fontSize: 17),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$price \$",
                          style:
                              const TextStyle(fontSize: 17, fontFamily: "sans"),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Discount",
                          style: TextStyle(fontSize: 17),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$discount %",
                          style:
                              const TextStyle(fontSize: 17, fontFamily: "sans"),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "shipping ",
                          style: TextStyle(fontSize: 17),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$shipping \$",
                          style:
                              const TextStyle(fontSize: 17, fontFamily: "sans"),
                        )),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Total price",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "sans",
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$totalprice \$",
                          style: const TextStyle(
                              fontSize: 17,
                              fontFamily: "sans",
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        )),
                  ],
                ),
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        CustomButtomCart(
          textbutton: "Order",
          onPressed: () {
            controller.goToPageCheckout();
          },
        )
      ],
    ));
  }
}
