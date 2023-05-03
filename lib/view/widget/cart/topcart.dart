import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class TopCartCount extends StatelessWidget {
  final String title;
  const TopCartCount({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(bottom: 5),
      // height: 20,
      decoration: BoxDecoration(
          color: AppColor.secoundColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColor.white),
      ),
    );
  }
}
