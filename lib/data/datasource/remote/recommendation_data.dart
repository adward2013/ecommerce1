import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class RecommendationData {
  Crud crud ;

  RecommendationData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.recommendation, {});

    return response.fold((l) => l, (r) => r) ;

  }
}