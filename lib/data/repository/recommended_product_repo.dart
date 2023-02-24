// if you load data from internet and we use getx package
// then class should extends getxservice
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  //creating object of Apiclient so that repository can have access to 
  // apiclient class method
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

// repository call apiclient with url and ask for data
  Future<Response> getRecommendedProductlist() async{
    // return await apiClient.get('end point url');
    return await apiClient.get(AppConstants.recommendedProductUrl);
  }
}
