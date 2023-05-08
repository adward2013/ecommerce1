import 'package:ecommerce/controller/forgetpassword/address/add_controller.dart';
import 'package:ecommerce/core/constant/color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'package:get/get.dart';

class AddressAdd extends StatelessWidget {
  AddressController controller = Get.put(AddressController());

  AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add New Address"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  OSMFlutter(
                    controller: controller.mapController,
                    isPicker: true,
                    trackMyPosition: true,
                    initZoom: 15,
                    stepZoom: 1.0,
                    userLocationMarker: UserLocationMaker(
                      personMarker: const MarkerIcon(
                        icon: Icon(
                          Icons.location_history_rounded,
                          color: Colors.red,
                          size: 48,
                        ),
                      ),
                      directionArrowMarker: const MarkerIcon(
                        icon: Icon(
                          Icons.double_arrow,
                          size: 48,
                        ),
                      ),
                    ),
                    markerOption: MarkerOption(
                        defaultMarker: const MarkerIcon(
                      icon: Icon(
                        Icons.person_pin_circle,
                        color: Colors.blue,
                        size: 56,
                      ),
                    )),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      child: MaterialButton(
                        onPressed: () {
                          controller.getlocaion();
                          controller.goToPageAddDetailsAddress();
                        },
                        child: Text("Complete"),
                        color: AppColor.primaryColor,
                        textColor: AppColor.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
