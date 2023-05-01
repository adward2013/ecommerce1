import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translatedatebase.dart';
import 'package:ecommerce/view/widget/productdetails/priceandcountitems.dart';
import 'package:ecommerce/view/widget/productdetails/subitemslist.dart';
import 'package:ecommerce/view/widget/productdetails/toppageitemsdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {},
          color: AppColor.secoundColor,
          child: const Text("Add To Cart" , style: TextStyle(color:Colors.white , fontWeight: FontWeight.bold ),),
        ),
      ),
      body: ListView(
        children: [
        const TopPeoductPageDetails(),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    translateDatebase(controller.itemsModel.itemsNameAr,
                        controller.itemsModel.itemsName),
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: AppColor.fourthColor,
                        )),
              const SizedBox(height: 10,),
                PriceAndCountItems(onAdd:(){},onRemove: () {
                },price: "200", count: "3"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    translateDatebase(controller.itemsModel.itemsDescAr,
                        controller.itemsModel.itemsDesc),
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.bodyText1!),
                const SizedBox(
                  height: 70,
                ),
                Text("Color",
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: AppColor.fourthColor,
                        )),
                const SizedBox(
                  height: 10,
                ),
               const SubItensList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
