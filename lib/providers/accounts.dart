import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class AccountsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = '${dotenv.env['POS_API_URL']}/api/v1/accounts';
    // httpClient.addResponseModifier(debugInterceptor);
  }

  Future<Response> signUp(String email, String password) async {
    return await post('/', {'email': email, 'password': password});
  }

  Future<Response> requestVerificationCode(String email) async {
    return await post('/regcode/', {'email': email});
  }

  Future<Response> verifyAccount(String email, String code) async {
    return await post('/verify/', {'email': email, 'code': code});
  }
}
