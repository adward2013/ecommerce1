import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class FavoriteData {
  Crud crud ;

  FavoriteData(this.crud);
  addFavorite(String userid , String itemsid) async {
    var response = await crud.postData(AppLink.favoriteadd, {"userid" : userid , "itemsid" : itemsid});

    return response.fold((l) => l, (r) => r) ;

  }
  removeFavorite(String userid , String itemsid) async {
    var response = await crud.postData(AppLink.favoriteremove, {"userid" : userid , "itemsid" : itemsid});

    return response.fold((l) => l, (r) => r) ;

  }
    viewFavorite(String id ) async {
    var response = await crud.postData(AppLink.favoriteview, {"id" : id });

    return response.fold((l) => l, (r) => r) ;

  }
   deleteFavorite(String id ) async {
    var response = await crud.postData(AppLink.favoritedelete, {"id" : id });

    return response.fold((l) => l, (r) => r) ;

  }
}