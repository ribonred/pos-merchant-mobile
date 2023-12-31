import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = '${dotenv.env['POS_API_URL']}/api/v1/auth';
    // httpClient.addResponseModifier(debugInterceptor);
    httpClient.defaultDecoder = (map) => Authorization.fromJson(map);
  }

  Future<Response<Authorization?>> logIn(String email, String password) async {
    return await post('/login/', {'email': email, 'password': password});
  }
}
