

import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.vieworders, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersdelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }
    rating(String ordersid , String  comment , String rating) async {
    var response = await crud.postData(AppLink.rating, {"id": ordersid , "rating" : rating , "comment" :comment});
    return response.fold((l) => l, (r) => r);
  }
}