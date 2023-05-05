import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/cart/custombuttoncart.dart';
import 'package:flutter/material.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String? price;
  final String? shipping;
  final String? totalprice;

  const BottomNavgationBarCart({super.key,   this.price,  this.shipping,  this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
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
                  style:  TextStyle(fontSize: 17, fontFamily: "sans"),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "shipping",
                  style: TextStyle(fontSize: 17),
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$shipping \$",
                  style: const TextStyle(fontSize: 17, fontFamily: "sans"),
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
                  style:  TextStyle(
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
        const SizedBox(
          height: 10,
        ),
        CustomButtomCart(
          textbutton: "place Order",
          onPressed: () {},
        )
      ],
    ));
  }
}
