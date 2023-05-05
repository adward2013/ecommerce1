import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CartData {
  Crud crud ;

  CartData(this.crud);
  addCart(String userid , String itemsid) async {
    var response = await crud.postData(AppLink.cartadd, {"usersid" : userid , "itemsid" : itemsid});

    return response.fold((l) => l, (r) => r) ;

  }
  removeCart(String userid , String itemsid) async {
    var response = await crud.postData(AppLink.cartremove, {"usersid" : userid , "itemsid" : itemsid});

    return response.fold((l) => l, (r) => r) ;

  }
    viewCart(String id ) async {
    var response = await crud.postData(AppLink.cartview, {"id" : id });

    return response.fold((l) => l, (r) => r) ;

  }
   getCountCart(String userid , String itemsid) async {
    var response = await crud.postData(AppLink.cartcountitems, {"usersid" : userid , "itemsid" : itemsid});

    return response.fold((l) => l, (r) => r) ;

  }
}