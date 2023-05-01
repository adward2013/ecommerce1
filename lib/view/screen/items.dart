import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/coustomappbar.dart';
import 'package:ecommerce/view/widget/items/Customlistutems.dart';
import 'package:ecommerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/items_controller.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
        body: ListView(children: [
      CustomAppBar(
        onPressedIconFavorite:(){
          
 Get.toNamed(AppRoute.myfavorite);
 
                    },
        titleappbar: "Find Product",
        onPressedIcon: () {},
        onPressedSearch: () {},
      ),
      const SizedBox(
        height: 20,
      ),
      const ListCategoriesItems(),
      Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, index) {
                        controllerFav.isFavorite[controller.data[index]
                            ['items_id']] = controller.data[index]['favorite'];
                        return CustomListItems(
                            itemsModel:
                                ItemsModel.fromJson(controller.data[index]));
                      })))),
    ]));
  }
}
