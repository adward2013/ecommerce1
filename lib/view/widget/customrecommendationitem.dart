import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';

import 'package:ecommerce/controller/recommendation_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translatedatebase.dart';

import 'package:ecommerce/data/model/recommendationmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRecommendation extends GetView<RecommendationController> {
  final RecommendationModel recommendationModel;

  const CustomRecommendation({super.key, required this.recommendationModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${recommendationModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagesItems}/${recommendationModel.itemsImage!}",
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    translateDatebase(
                        recommendationModel.itemsNameAr, recommendationModel.itemsName),
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       "Rating 3.5 ",
                  //       textAlign: TextAlign.center,
                  //     ),
                  //     Container(
                  //       alignment: Alignment.bottomCenter,
                  //       height: 22,
                  //       child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           ...List.generate(
                  //               5,
                  //               (index) => const Icon(
                  //                     Icons.star,
                  //                     size: 15,
                  //                   ))
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${recommendationModel.itemsPrice} \$",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sans"),
                      ),
                      // Text(
                      //   "${recommendationModel.recommendationsCountrating}",
                      //   style: const TextStyle(
                      //       color: AppColor.primaryColor,
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.bold,
                      //       fontFamily: "sans"),
                      // ),
                      GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[recommendationModel.itemsId] ==
                                    1) {
                                  controller.setFavorite(recommendationModel.itemsId, 0);
                                  controller
                                      .removeFavorite(recommendationModel.itemsId.toString());
                                } else {
                                  controller.setFavorite(recommendationModel.itemsId, 1);
                                  controller
                                      .addFavorite(recommendationModel.itemsId.toString());
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[recommendationModel.itemsId] == 1
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primaryColor,
                              )))
                    ],
                  
                ),

                ]),
          ),
        ));
  }
}
