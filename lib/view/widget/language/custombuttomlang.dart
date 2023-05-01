import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtomLang extends StatelessWidget {
  final String textbutton;
  final  void Function()? onPressed;
  const CustomButtomLang({Key? key, required this.textbutton, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed:onPressed ,
        child:  Text(
          textbutton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
