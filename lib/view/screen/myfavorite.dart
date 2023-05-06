import 'package:ecommerce/controller/myfavorite_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/coustomappbar.dart';
import 'package:ecommerce/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteController>(
            builder: (controller) => ListView(
              children: [
                // CustomAppBar(
                //   onPressedIconFavorite: () {
                //     Get.toNamed(AppRoute.myfavorite);
                //   },
                //   titleappbar: "Find Product",
                //   onPressedIcon: () {},
                //   onPressedSearch: () {},
                // ),
                const SizedBox(height: 20),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2 , childAspectRatio: 0.8),
                      itemBuilder: (context, index) {
                        return CustomListFavoriteItems(itemsModel: controller.data[index]);
                      },
                    ))
              ],
            ),
          )),
    );
  }
}
