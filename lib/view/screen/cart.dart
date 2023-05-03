import 'package:ecommerce/view/widget/cart/appbarcart.dart';
import 'package:ecommerce/view/widget/cart/coustombottomnavgationBarCart.dart';
import 'package:ecommerce/view/widget/cart/customitemcart.dart';
import 'package:ecommerce/view/widget/cart/topcart.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavgationBarCart(price: "1200", shipping: "200",totalprice: "1400",),
      body: ListView(children: [
        const TopAppBarCart(title: "My Cart"),
        const SizedBox(height: 10,),
  const TopCartCount(title:"You Have 2 Items In Your Cart"),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children:const [
             CustomItemsCartList(name: 'LabeTop HP', count: '2', price: '300',),
             CustomItemsCartList(name: 'phone poco', count: '2', price: '300',),
  
            ],
          ),
        )
      ]),
    );
  }
}
