import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/coustomappbar.dart';
import 'package:ecommerce/view/widget/home/coustomcardhome.dart';
import 'package:ecommerce/view/widget/home/customtitlehome.dart';
import 'package:ecommerce/view/widget/home/listcategorieshome.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView(
                children: [
                  CustomAppBar(
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRoute.myfavorite);
                    },
                    titleappbar: "Find Product",
                    onPressedIcon: () {},
                    onPressedSearch: () {},
                  ),
                  const CoustomCardHome(
                    title: "A summer surprise",
                    body: "cashback 20%",
                  ),
                  const CustomTitleHome(title: "Categories"),
                  const ListCategoriesHome(),
                  const CustomTitleHome(title: "Product for you"),
                  const ListItemsHome(),
                  const CustomTitleHome(title: "Offer"),
                  const ListItemsHome(),
                ],
              ))),
    );
  }
}
