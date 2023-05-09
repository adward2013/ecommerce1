import 'package:ecommerce/core/class/staturequest.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? deliveryType;
  String? addressid;

  choosePaymentMetod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }
}
