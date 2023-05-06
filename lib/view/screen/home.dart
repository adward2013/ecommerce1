import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
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
      builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ListView(
            children: [
              CustomAppBar(
                mycontroller: controller.search!,
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onPressedIconFavorite: () {
                  Get.toNamed(AppRoute.myfavorite);
                },
                titleappbar: "Find Product",
                onPressedIcon: () {},
                onPressedSearch: () {
                  controller.onSearchItems();
                },
              ),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearch
                      ? ListItemsSearch(
                          listdatamodel: controller.listdata,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            CoustomCardHome(
                              title: "A summer surprise",
                              body: "cashback 20%",
                            ),
                            CustomTitleHome(title: "Categories"),
                            ListCategoriesHome(),
                            CustomTitleHome(title: "Product for you"),
                            ListItemsHome(),
                            // CustomTitleHome(title: "Offer"),
                            //ListItemsHome(),
                          ],
                        ))
            ],
          )),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Card(
            child: InkWell(
              onTap: () {
                controller.goToPageProductDetails(listdatamodel[index]);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagesItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
