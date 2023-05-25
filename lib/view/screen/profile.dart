import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imgeasset.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressModel addressModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User avatar
            Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(AppImageAsset.avatar),
                      ),
                    ),
           const SizedBox(height: 16.0),
            // User name
           const Text(
              'Edward Labeb',
              style: TextStyle(color: AppColor.primaryColor , fontWeight:FontWeight.bold , fontSize: 20),
            ),
            const SizedBox(height: 16.0),
            // User email
            const Text(
              'adwar@yahoo.com',
              style: TextStyle(color: AppColor.grey2 , fontWeight:FontWeight.bold , fontSize: 15),
            ),
           const SizedBox(height: 16.0),
            // User address
            
           const SizedBox(height: 16.0),
            // User order history
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order History',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 16.0),
                    // List of orders
                    ...List.generate(
                      1,
                      (index) => ListTile(
                        leading: Icon(Icons.shopping_cart),
                        title: Text('Order #${index + 1}'),
                        subtitle: Text('\$100.00'),
                        trailing: Text('2023-05-24'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}