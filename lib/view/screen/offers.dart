import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/offfers_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/offers/customitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offers"),
      ),
      body: GetBuilder<OffersController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) =>
                    CustomListItemsOffer(itemsModel: controller.data[index]),
              ))),
    );
  }
}
