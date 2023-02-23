import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

// we are using getx for managing our api client controllers and repisotory
// thatswhy we are extending it to GetConnect
class ApiClient extends GetConnect implements GetxService {
  // in general when we talk to server we have token
  // that token should be initialized in api client class
  late String token;
  // we must have url that talk to server
  final String appBarUrl;
  //---------------------------------
  late Map<String, String> _mainHeaders;
  // marked as late means before using this variable we should initialize it.
  ApiClient({required this.appBarUrl}) {
    //getx pacakage management system should know what is your base url
    // so u pass it to that one and each time u make a request
    //how long the request should try

    baseUrl = appBarUrl;
    // here we try to get data from the server for 30 seconds
    timeout = Duration(seconds: 30);
    token = AppConstants.token;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    //the token we send is of Bearer type
  }
  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      //if it failed to return data then we return error message
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
}
