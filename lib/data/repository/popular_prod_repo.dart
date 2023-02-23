// if you load data from internet and we use getx package
// then class should extends getxservice
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  //creating object of Apiclient so that repository can have access to 
  // apiclient class method
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

// repository call apiclient with url and ask for data
  Future<Response> getPopularProductlist() async{
    // return await apiClient.get('end point url');
    return await apiClient.get('/api/v1/products/popular');
  }
}
