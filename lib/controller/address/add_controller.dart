import 'dart:ffi';

import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';

class AddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  GeoPoint? geoPoint;

  String? latitude;
  String? longitude;

  MapController mapController = MapController(
    initMapWithUserPosition: false,
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    areaLimit: BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west: 5.9559113,
    ),
  );

  getlocaion() async {
    Position position = await Geolocator.getCurrentPosition();
    latitude = position.latitude.toString();
    longitude = position.longitude.toString();

    print('Latitude: $latitude');
    print('Longitude: $longitude');
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressadddetails,
        arguments: {"lat": latitude, "long": longitude});
  }

  @override
  void onInit() {
    //  _getCurrentLocation();
    getlocaion();
    mapController = MapController();
    super.onInit();
  }

  @override
  void dispose() {
    mapController.dispose;
    MapController();

    super.dispose();
  }
}
