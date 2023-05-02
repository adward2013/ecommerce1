import 'package:ecommerce/controller/settings_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imgeasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Container(
      child: ListView(
        children: [
          Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: Get.width / 3,
                  color: AppColor.primaryColor,
                ),
                Positioned(
                    top: Get.width / 3.9,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(AppImageAsset.avatar),
                      ),
                    )),
              ]),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  onTap: () {},
                  title: const Text("Dark Mode"),
                  trailing: Switch(onChanged: (val){} , value: true,),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text("Address"),
                  trailing: const Icon(Icons.location_on_outlined),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text("About Us"),
                  trailing: const Icon(Icons.help_outlined),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text("Contact Us"),
                  trailing: const Icon(Icons.contact_mail_outlined),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
