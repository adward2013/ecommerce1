import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';


class CustomButtomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbuttom;
  final IconData iconData;
  
  final bool active ;

  const  CustomButtomAppBar(
      {super.key,
      required this.textbuttom,
      this.onPressed,
      required this.iconData,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          iconData,
          color: active == true ?AppColor.primaryColor : AppColor.grey2 ,
        ),
        Text(
          textbuttom,
          style: TextStyle(color: active == true ?AppColor.primaryColor : AppColor.grey2),
        )
      ]),
    );
  }
}
