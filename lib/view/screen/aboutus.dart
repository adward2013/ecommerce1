import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('About Us'),
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: const[
Text(
'Welcome to our e-commerce app!',
style: TextStyle(color: AppColor.grey),
),
SizedBox(height: 16.0),
Text(
'We are a team of passionate developers who are committed to providing our users with the best possible shopping experience. We offer a wide variety of products at competitive prices, and we are always adding new items to our inventory. We also offer free shipping on orders over \$50.',style: TextStyle(color: AppColor.grey),
),
SizedBox(height: 16.0),
Text(
'We believe that shopping should be easy and convenient, and thats why we have made our app so user-friendly. You can browse our products by category, price, or brand, and you can easily add items to your cart with just a few taps. We also offer a variety of payment options, so you can choose the one that works best for you.',style: TextStyle(color: AppColor.grey),
),
SizedBox(height: 16.0),
Text(
'We are committed to providing our users with the best possible customer service. If you have any questions or problems, please don`t hesitate to contact us. We are always happy to help.',style: TextStyle(color: AppColor.grey),
),
SizedBox(height: 16.0),
Text(
'Thank you for choosing our e-commerce app! We hope you enjoy shopping with us.',style: TextStyle(color: AppColor.grey)
),
],
),
),
);
}
}