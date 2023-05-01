import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Text(
        text,
        textAlign: TextAlign.center,
        // ignore: deprecated_member_use
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
