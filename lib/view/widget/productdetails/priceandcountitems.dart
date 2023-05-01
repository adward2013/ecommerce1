import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;

  final String price;
  final String count;

  const PriceAndCountItems({super.key, this.onAdd, this.onRemove, required this.price, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(bottom: 5),
                width: 50,
                //height: 30,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                )),
                child:  Text(count,
                    style: const TextStyle(
                        fontSize: 20, fontFamily: "sas", height: 1.5))),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
         Text(
          "$price \$",
          style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 30,
              fontFamily: "sas",
              height: 0.8),
        ),
      ],
    );
  }
}
