import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imgeasset.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagename,required this.onAdd,required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imagesItems}/$imagename",
                  height: 90,
                  //fit: BoxFit.cover,
                )),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(name),
                  subtitle: Text(
                    "$price \$",
                    style: const TextStyle(
                        fontFamily: "sans",
                        color: AppColor.primaryColor,
                        fontSize: 15),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                    height: 35,
                    child: IconButton(onPressed: onAdd, icon: Icon(Icons.add))),
                SizedBox(
                    height: 30,
                    child: Text(
                      count,
                      style: const TextStyle(fontFamily: "sans"),
                    )),
                SizedBox(
                    height: 25,
                    child: IconButton(
                        onPressed: onRemove, icon: const Icon(Icons.remove))),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
