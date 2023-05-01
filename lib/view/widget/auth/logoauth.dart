

import 'package:ecommerce/core/constant/imgeasset.dart';
import 'package:flutter/cupertino.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logo , height: 170,);
  }
}
