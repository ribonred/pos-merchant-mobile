import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'sign_in.dart';

class SignInProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Authorization.fromJson(map);
    httpClient.baseUrl = dotenv.env['POS_API_URL'];
  }

  Future<Response<Authorization?>> logIn(String email, String password) async {
    return await post(
      '/api/v1/auth/login/',
      {'email': email, 'password': password},
    );
  }
}
