import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class RecommendationData {
  Crud crud ;

  RecommendationData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.recommendation, {"id" : id });

    return response.fold((l) => l, (r) => r) ;

  }
}