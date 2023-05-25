import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translatedatebase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/items/ratingitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagesItems}/${itemsModel.itemsImage!}",
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    translateDatebase(
                        itemsModel.itemsNameAr, itemsModel.itemsName),
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
                        "${itemsModel.itemsPrice} \$",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sans"),
                      ),
                      GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemsId] ==
                                    1) {
                                  controller.setFavorite(itemsModel.itemsId, 0);
                                  controller
                                      .removeFavorite(itemsModel.itemsId.toString());
                                } else {
                                  controller.setFavorite(itemsModel.itemsId, 1);
                                  controller
                                      .addFavorite(itemsModel.itemsId.toString());
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == 1
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primaryColor,
                              )))
                    ],
                  
                ),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                      onPressed: () {
                        showDialogTatingitem(context,itemsModel.itemsId.toString());
                      },
                      color: AppColor.thirdColor,
                      textColor: AppColor.secoundColor,
                      child: const Text("Rating"),
                    ),
                ),
                ]),
          ),
        ));
  }
}
