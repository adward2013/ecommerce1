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
  //   viewFavorite(String id ) async {
  //   var response = await crud.postData(AppLink.favoriteview, {"id" : id });

  //   return response.fold((l) => l, (r) => r) ;

  // }
  //  deleteFavorite(String id ) async {
  //   var response = await crud.postData(AppLink.favoritedelete, {"id" : id });

  //   return response.fold((l) => l, (r) => r) ;

  // }
}