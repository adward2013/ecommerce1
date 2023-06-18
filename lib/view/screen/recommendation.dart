import 'package:ecommerce/controller/favorite_controller.dart';

import 'package:ecommerce/controller/recommendation_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/customrecommendationitem.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendationView extends StatelessWidget {
  const RecommendationView({super.key});

  @override
  Widget build(BuildContext context) {
    RecommendationController controller = Get.put(RecommendationController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recommendatios"),
      ),
      body: GetBuilder<RecommendationController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) =>
                    CustomRecommendation(recommendationModel: controller.data[index]),
              ))),
    );
  }
}
