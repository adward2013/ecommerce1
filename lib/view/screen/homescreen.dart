import 'dart:io';

import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/home/custombottomappbarhome.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/homescreen.dart';
import 'package:flutter/material.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoute.cart);
              },
              child: const Icon(Icons.shopping_basket_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: WillPopScope(
                child: controller.listPage.elementAt(controller.currentpage),
                onWillPop: () {
                  Get.defaultDialog(
                    title: "Warning",
                    middleText: "Do You Want To Exit The app",
                    cancelTextColor: AppColor.secoundColor,
                    confirmTextColor: AppColor.secoundColor,
                    buttonColor: AppColor.thirdColor,
                    onCancel: () {},
                    onConfirm: () {
                      exit(0);
                    },
                  );
                  return Future.value(false);
                })));
  }
}
