import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imgeasset.dart';
import 'package:ecommerce/view/widget/checkout/carddeliveerytype.dart';
import 'package:ecommerce/view/widget/checkout/cardshippingaddress.dart';
import 'package:ecommerce/view/widget/checkout/cartpaymentmathod.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
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
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
        ),
      )),
      body: Container(
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
         const  CardPaymentMethodCheckout(title: "Cast", isActive: true,),
         const SizedBox(
              height: 10,
            ),
         const  CardPaymentMethodCheckout(title: "Payment Cart",isActive: false,),
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
              children: const [
                CardDeliveryTypeCheckout(active: true, imagename: AppImageAsset.delivery, title: 'Delivery',),
                
                 SizedBox(
                  width: 10,
                ),
                 CardDeliveryTypeCheckout(active: false, imagename: AppImageAsset.drivethru, title: 'Recive',),
                
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Shipping  Address",
              style: TextStyle(
                  color: AppColor.secoundColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
           const CardShppingAddressCheckout(title: "Home",isactive: true,body: "EdwardStreet", ),
           const CardShppingAddressCheckout(title: "Company",isactive: false,body: "9Street", ),
            
          ],
        ),
      ),
    );
  }
}
