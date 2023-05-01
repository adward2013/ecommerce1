import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TopPeoductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopPeoductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
          clipBehavior: Clip.none,
            children: [
              Container(
                height: 180,
                decoration: const BoxDecoration(
                  color: AppColor.secoundColor,
                ),
              ),
              Positioned(
                  top: 30,
                  right: Get.width / 8,
                  left: Get.width / 8,
                  child: Hero(
                    tag: "${controller.itemsModel.itemsId}",
                    child: Center(
                        child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagesItems}/${controller.itemsModel.itemsImage!}",
                      height: 250,
                      fit: BoxFit.fill,
                    )),
                  ))
            ],
          );
  }
}