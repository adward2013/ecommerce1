import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/staturequest.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  CartController cartController = Get.put(CartController());

  late ItemsModel itemsModel;

  late StatusRequest statusRequest;

  int countitems = 0;

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems =
        await cartController.getCountItems(itemsModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  List subitems = [
    {
      "name": "red",
      "id": 1,
      "active": "1",
    },
    {
      "name": "blue",
      "id": 2,
      "active": "0",
    },
    {"name": "black", "id": 3, "active": "1"}
  ];

  add() {
    cartController.add(itemsModel.itemsId.toString());
    countitems++;
     update();
  }

  remove() {
    if (countitems > 0) {
      cartController.remove(itemsModel.itemsId.toString());
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();

    super.onInit();
  }
}
