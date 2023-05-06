import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class HomeDate {
  Crud crud ;

  HomeDate(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.homepage, {});

    return response.fold((l) => l, (r) => r) ;

  }

   searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search" : search });

    return response.fold((l) => l, (r) => r) ;

  }
}