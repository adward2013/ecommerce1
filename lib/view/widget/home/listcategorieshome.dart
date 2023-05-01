import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translatedatebase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  
  const ListCategoriesHome( {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              i : index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]));
          }),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories( {super.key, required this.categoriesModel ,required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i! , categoriesModel.categoriesId.toString());
      },
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.thirdColor),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 70,
          width: 70,
          child: SvgPicture.network(
            "${AppLink.imagesCategories}/${categoriesModel.categoriesImage}",
            color: AppColor.primaryColor,
          ),
        ),
        Text(
          "${translateDatebase(categoriesModel.categoriesNameAr,categoriesModel.categoriesName)}",
          style: const TextStyle(fontSize: 13, color: AppColor.black),
        )
      ]),
    );
  }
}
