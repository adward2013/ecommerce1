import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ItemsData {
  Crud crud ;

  ItemsData(this.crud);
  getData(String id ,String usersid) async {
    var response = await crud.postData(AppLink.items, {"id" : id.toString() , "usersid" : usersid});

    return response.fold((l) => l, (r) => r) ;

  }
      rating(String userid ,String itemid , String  comment , String rating) async {
    var response = await crud.postData(AppLink.ratingitem, {"userid": userid,"itemid": itemid.toString() , "rating" : rating , "comment" :comment});
    return response.fold((l) => l, (r) => r);
  }
}